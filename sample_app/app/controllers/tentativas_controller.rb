class TentativasController < ApplicationController
    before_filter :admin_or_validParticipant, :only => [:create]
    before_filter :authenticate
    
    require "rexml/document"
    
    
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

  	if (params[:tentativa])
  	  
  	  path = createFolderAndFile
  	  
  	  if params[:tentativa][:path].content_type!= "application/octet-stream"
  	    tryToDescompact(path)
	    end

	    case params[:commit]
        when "Submeter tentativa - Codigo" 
          trataSource(path)
        when "Submeter tentativa - XML" 
          if current_user.admin?
            trataXML(path)
            flash[:success] = "Tentativa(s) submetida(s) com sucesso!"
            redirect_to @enunciado
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
        compileAndExecute##falta por isto a funcar bem
      else
        ##qualquer coisa como encntrar e correr o make file e so dps executar..
    end
     
    params[:tentativa][:user_id] = params[:user_id]

   	@tentativa = @enunciado.tentativas.build(params[:tentativa])
     if @tentativa.save
       flash[:success] = "Tentativa submetida com sucesso!" + x
       redirect_to @tentativa
     else
       @title = "Enunciado"
       render @enunciado
     end
 	  
  end
	
	def compileAndExecute
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
    flash[:error] = "cd "+ dir + "\n gcc " + file
    #se a.out existe compilou, se nao, nao compilou
    if File.exists?(dir + "/a.out")
      params[:tentativa][:compilou] = true
	    File.delete(dir + "/a.out")
    else
      params[:tentativa][:compilou] = false
    end
	  #flash[:error] = "gcc " + params[:tentativa][:path]
	  #compileRes.empty? ? params[:tentativa][:compilou] = true : params[:tentativa][:compilou] = false
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

    files.each do |xml_file_path|
      ##IMPORTANTE antes de fazer a tentativa valta validar com o XSD
      parseTentativaXML(xml_file_path)
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
    comp = 0
    REXML::XPath.each( doc, "//compilou" ){ |compilou_element|
      comp = compilou_element.text.to_i
    }
    source_name=""
    REXML::XPath.each( doc, "//codigoFonte" ){ |codigoFonte_element|
      source_name = codigoFonte_element.text
    }

    path_para_source = File.join(File.dirname(xml_file_path),source_name)
    
    @tentativa = Tentativa.new
    @tentativa = @enunciado.tentativas.build(:user_id=>user,:path=>path_para_source,:compilou=>comp)
    @tentativa.save
    
    bat_id = ""
    out=""
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
      @result = Result.new
      @result = @tentativa.results.build(:bateria_id=>bat_id,:output=>out)        
    }
  end

  
  
end
