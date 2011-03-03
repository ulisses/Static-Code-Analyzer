class TentativasController < ApplicationController
    before_filter :admin_or_validParticipant, :only => [:create]
    before_filter :authenticate
    
    require "rexml/document"
    require 'fileutils'    
    
  def index      
    if (params[:enunciado_id] && params[:user_id])
      @user = current_user      
      @enunciado = Enunciado.find(params[:enunciado_id])
      @concurso = Concurso.find(@enunciado.concurso_id)
      @tentativas = Tentativa.where(:user_id=>current_user.id, :enunciado_id=>@enunciado.id).paginate(:page => params[:page])
    else
      if (params[:user_id])
        @user = current_user
        @tentativas = Tentativa.where(:user_id=>current_user.id).paginate(:page => params[:page])
      else
        if (params[:enunciado_id])
          @enunciado = Enunciado.find(params[:enunciado_id])
          @concurso = Concurso.find(@enunciado.concurso_id)
          @tentativas = @enunciado.tentativas.paginate(:page => params[:page])
        else
          @tentativas = Tentativa.all.paginate(:page => params[:page])
      end
    end
  end
    
  end

  def create
  	@enunciado = Enunciado.find(params[:enunciado_id])
    @erros = ""
    
  	if (params[:tentativa])
  	  
  	  path = createFolderAndFile
  	  
  	  if params[:tentativa][:path].content_type!= "application/octet-stream"
  	    tryToDescompact(path)
	    end
      params[:tentativa][:execStop] = false
      params[:tentativa][:tExec] = -1

	    case params[:commit]
        when "Submeter tentativa - Codigo" 
          trataSource(path)
        when "Submeter tentativa - XML" 
          if current_user.admin?
            trataXML(path)
            if @erros.empty?
              flash[:success] = "Tentativa(s) submetida(s) com sucesso!"
              redirect_to @enunciado
            else
            	langIds = EnunciadoLang.where(:enunciado_id=> @enunciado.id)
            	@languages = Array.new
              langIds.each do |l|
            	  @languages << Language.find(l.language_id) 
          	  end 
            	@tentativa = Tentativa.new
            	flash[:error] = @erros
              redirect_to @enunciado
            end
          else
            flash[:success] = "So um docente pode submeter tentativas no formato XML!"
            redirect_to @enunciado
          end
      end
        	  	  
    else
      flash[:error] = "Nao selecionou nenhum ficheiro para submissao!"
      redirect_to @enunciado
    end        
  end


  def show
	  @tentativa = Tentativa.find(params[:id])
  	@enunciado = Enunciado.find(@tentativa.enunciado_id)
	
  	@codigo = Array.new
  	file = File.new(@tentativa.path,"r")
    if file
      file.each_line do |line| @codigo << line end
    end
  end
  
  ########################################################################################################################
  
  
  private
  
  #verifica se e admin ou um participante e ainda em tempo de participacao
	def admin_or_validParticipant
	  concurso = Concurso.find(Enunciado.find(params[:enunciado_id]).concurso_id)
    redirect_to(root_path) unless 
      (current_user.admin? || ( participante(concurso) && (tRestante(concurso) > 0) ) ) 
  end
  
	#verifica se é participante, se for retorna-o
  def participante(concurso)
    aux = Participante.where(:user_id=>current_user.id , :concurso_id=>concurso.id).first
  end
  
  #calcula hora do fim do concurso para o utilizador actual
  def terminaC(concurso)
    advanceMin = concurso.dur.hour*60 + concurso.dur.min
    return participante(concurso).dataRegisto.advance(:minutes=> advanceMin)
  end
  
  #calcula o tempo que resta ao utilizador logado para continuar a participar
  def tRestante(concurso)
    return ((terminaC(concurso) - DateTime.now) / 60)
  end
	
  ##############################################################################################################
  #### trata  do caso em que tenta submeter codigo fonte

  def trataSource (path)
    x =params[:tentativa][:path].content_type
    case params[:tentativa][:path].content_type
      when "application/octet-stream"
        params[:tentativa][:path]=path
        compile##falta por isto a funcar bem
      else
        ##qualquer coisa como encntrar e correr o make file e so dps executar..
    end
      
    params[:tentativa][:user_id] = params[:user_id]

    guardaMelhorResultado

   	@tentativa = @enunciado.tentativas.build(params[:tentativa])
     if @tentativa.save
       if @erros.empty?
         flash[:success] = "Tentativa submetida com sucesso! A sua tentativa passou todos os testes a que foi submetida."
       else
         flash[:error] = @erros
       end
       redirect_to @tentativa
     else
       @title = "Enunciado"
       render @enunciado
     end
 	  
  end
	
	def compile
	  path= params[:tentativa][:path]
	  file = File.basename(path) 
	  #dir passa a ser a pasta na qual trabalhamos
	  dir = File.dirname(path)
	  #se existir o ficheiro a.out apaga-o
	  if File.exists?(dir + "/a.out")
	    File.delete(dir + "/a.out")
    end
    #tenta compilar
    `cd #{dir} && gcc #{file}`
    #se a.out existe compilou, se nao, nao compilou
    if File.exists?(dir + "/a.out")
      params[:tentativa][:compilou] = true
      execGeral(dir)
	    File.delete(dir + "/a.out")
    else
      params[:tentativa][:compilou] = false
      flash[:error] = "A tentativa submetida nao compilou!"
    end
	  #flash[:error] = "gcc " + params[:tentativa][:path]
	  #compileRes.empty? ? params[:tentativa][:compilou] = true : params[:tentativa][:compilou] = false
  end
  
  def execGeral(dir)
    baterias = @enunciado.baterias
    
    #para o caso de não existirem testes para este enunciado
    if baterias && baterias.size > 0 
      total = baterias.size
      correct = 0
    
      before = Time.now.to_f
      baterias.each do |bateria|
        if params[:tentativa][:execStop] == false
          res = execEach(bateria,dir) 
          if res == true
            correct += 1
          end
        end
      end
      after = Time.now.to_f
      params[:tentativa][:tExec] = after - before
    
      #guarda percentagem de testes no qual o codigo passou
      params[:tentativa][:passedTests] = (correct/total) * 100
    
      #se nao passou em todos os testes, cria erro para apresentar
      if !((total - correct) == 0)
        aux = @erros
        @erros = "A sua tentativa foi submetida com sucesso, mas passou em apenas em " +correct.to_s + " dos "+total.to_s + " testes!      " + aux
      end

    else
      params[:tentativa][:passedTests] = 0
      @erros = "Nao existem testes para este enunciado!"
    end
  end
  
  def execEach(bateria,dir)
    input = bateria.input
    
    #thread que executa o a.out 
    out = "default";i=0
    exec = Thread.new do
      out = `cd #{dir} && ./a.out #{input}`
    end
    
    #thread que conta x segundos e dps termina a execucao do programa
    timer = Thread.new do
      sleep 5
      if exec.alive?
        Thread.kill(exec)
        i=1
        if params[:tentativa][:execStop] == false
          @erros += "Time out! Pelo menos a execucao de um dos inputs foi terminada por demorar demasiado tempo!"
        end
        params[:tentativa][:execStop] = true
      end
    end
    
    exec.join
    if timer.alive?
      Thread.kill(timer)
    end
    timer.join
    
    if i==1
      return false
    end
    
    #timestamp
    t = DateTime.now
    t = t.to_s(:number)
    
    # cria o caminho físico da pasta
		path = File.join(Rails.root, "data/temp/#{t}--#{bateria.id}--#{current_user.id}")
		
		#cria a pasta caso nao exista (temporaria)
		if !File.exists?(path)
			Dir.mkdir(path)
		end
		
		#cria path para os dois ficheiros temporarios
		path1 = File.join(path,"file1")
		path2 = File.join(path,"file2")
		
		#escreve o output num ficheiro para poder ser usado pelo diff
		File.open(path1, "wb") do |f| 
			f.write(out.chomp)#ATENÇAO RETIRA OS \n -> PODE GERAR PROBLEMAS? 
		end

		#escreve o output num ficheiro para poder ser usado pelo diff		
		File.open(path2, "wb") do |f| 
			f.write(bateria.output)
		end
		
		#vai buscar a funcao de aval deste enunciado
    func = Function.find(@enunciado.funcao_id).func
    
    #compara os ficheiros
    `#{func} #{path1} #{path2}` ; result=$?.success?
    
    #eliminar pasta temporaria
    if File.exists?(path)
	    FileUtils.rm_rf path
    end

    if result == true
     return true
   else
     return false
   end
   
  end
  
  def guardaMelhorResultado
    res = current_user.results.where(:enunciado_id=>@enunciado.id,:concurso_id=>@enunciado.concurso_id)
    if res.size == 0
      r = current_user.results.build(:enunciado_id=>@enunciado.id,
                                 :concurso_id=>@enunciado.concurso_id,
                                 :bestRes=>params[:tentativa][:passedTests]);
      r.save
    else
      result = res.first
      if result.bestRes < params[:tentativa][:passedTests]
        result.bestRes = params[:tentativa][:passedTests]
        result.save
      end
    end
  end
  ##########################       ############################
  
  #cria a pasta para o user, para a tentativa e escreve o ficheiro
  def createFolderAndFile
    #timestamp
		t = DateTime.now
		
		# cria o caminho físico do arquivo
		filename = params[:tentativa][:path].original_filename
		path = File.join(Rails.root, "data/concursos","contest-"+@enunciado.concurso_id.to_s,"en-"+@enunciado.id.to_s,"user-"+current_user.id.to_s)
		#completa o path com o nome do ficheiro
		
		#cria a pasta caso nao exista (para o user)
		if !File.exists?(path)
			Dir.mkdir(path)
		end
		
		path = File.join(path,"tent-"+t.to_s(:number))
		#cria a pasta caso nao exista (para a tentativa)
		if !File.exists?(path)
			Dir.mkdir(path)
		end
		
		path = File.join(path,filename)
		
		# escreve o arquivo no local designado
		File.open(path, "wb") do |f| 
			f.write(params[:tentativa][:path].read)
		end
		
		#guarda na @tentativa.path o path onde ficou guardado o ficheiro
		#params[:tentativa][:path] = path
		return path
  end
  
  #descompacta caso o ficheiro venha comprimido
  def tryToDescompact (path)
    dir = File.dirname(path)
    file = File.basename(path)
    #ext = File.extname(path)
        
    case params[:tentativa][:path].content_type
      when "application/zip"
        `cd #{dir} && unzip #{file}`
      when "application/x-gzip" #.tar.gz
        `cd #{dir} && tar -vzxf #{file}`
      when "application/x-bzip2" #.tar.bz2
        `cd #{dir} && tar -jxvf #{file}`
      when "application/x-tar" #.tar
        `cd #{dir} && tar -xvf #{file}`  
    end
  end
  
  ############  ############  ############  ############  ############  ############  ############  ############
  #Parte referente a submissao do xml

  def trataXML(path)
    files = Dir.glob(File.dirname(path)+"/*.xml")

    if (files.size != 0)
      files.each do |xml_file_path|
        ##tenta validar o enunciado com o xsd
        xsdpath = File.join(Rails.root,"public/xsd/tentativa.xsd")
        resVal = `xmlstarlet val -b -s #{xsdpath} #{xml_file_path}`
        if resVal.empty?
          #se for valido faz parse
          parseTentativaXML(xml_file_path)
        else
          @erros += "O ficheiro #{xml_file_path} nao foi validado pelo xmlschema!"
        end
      end
    else
      @erros += "Nao foram encontrados ficheiros do tipo xml na sua submissao!"
    end

  end
  
  #faz parse do ficheiro xml, adiciona a tentativa e os resultados a BD
  def parseTentativaXML(xml_file_path)
    xml_data = ""
       
    file = File.new(xml_file_path,"r")
    if file
      file.each_line do |line| xml_data+= line end
    end 


    doc = REXML::Document.new( xml_data )
    REXML::XPath.each( doc, "//datetime" ){ |datetime_element|
      datetime = Time.xmlschema(datetime_element.text)
    }
    user = 1
    REXML::XPath.each( doc, "//user_id" ){ |user_id_element|
      user = user_id_element.text.to_i
    }
    comp = false
    REXML::XPath.each( doc, "//compilou" ){ |compilou_element|
      if compilou_element.text == "true"
        comp = true
      else
        comp = false
      end
    }
    source_name=""
    REXML::XPath.each( doc, "//codigoFonte" ){ |codigoFonte_element|
      source_name = codigoFonte_element.text
    }

    path_para_source = File.join(File.dirname(xml_file_path),source_name)
    
    @tentativa = Tentativa.new
    @tentativa = @enunciado.tentativas.build(:user_id=>user,:path=>path_para_source,:compilou=>comp)
    @tentativa.save
    
    bat_id=0
    out = ""
    REXML::XPath.each( doc, "//Teste" ){ |teste_element|
      teste_element.each_element do |e|
        if e.name == "Bateria_id"
          bat_id = e.text.to_i
        else
          if e.name == "Output"
            out = e.text
          end
        end
      end

#####FALTA GUARDAR RES AQUI
    }
  end

  
  
end
