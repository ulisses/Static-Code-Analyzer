class EnunciadosController < ApplicationController
  before_filter :admin_user, :only => [:edit, :update, :new, :destroy, :create,:newxml,:createxml]
  before_filter :admin_or_validParticipant, :only => [:show]
  before_filter :authenticate  
  
  require "rexml/document"
      
  def show
  	@title = "Enunciado"
  	@enunciado = Enunciado.find(params[:id])
  	@concurso = Concurso.find(@enunciado.concurso_id)
  	@function = Function.find(@enunciado.funcao_id)
  	langIds = EnunciadoLang.where(:enunciado_id=> @enunciado.id)
  	@languages = Array.new
    langIds.each do |l|
  	  @languages << Language.find(l.language_id) 
  	end 
  	@title = langIds.size
  	@tentativa = Tentativa.new
  end
  
  def edit
    @title = "Editar enunciado"
    @enunciado = Enunciado.find(params[:id])
    @languages = Language.all
    @myLanguages = EnunciadoLang.where(:enunciado_id=>@enunciado.id)
  end

  def update
     @enunciado = Enunciado.find(params[:id])
     if @enunciado.update_attributes(params[:enunciado])

       #apaga as linguagens do enunciado
       @enunciado.enunciadoLangs.each do |el|
         el.destroy
       end
       
       #coloca as novas linguagens
       params[:langs].each do |l|
 	       el = @enunciado.enunciadoLangs.build(:language_id=> l.to_i)
 	       el.save
       end
 	       
       flash[:success] = "Enunciado alterado com sucesso."
       redirect_to @enunciado
     else
       @languages = Language.all
       @myLanguages = EnunciadoLang.where(:enunciado_id=>@enunciado.id)
       @title = "Editar enunciado."
       render 'edit'
     end
   end
   
  def new
    @title = "Novo enunciado"
    @enunciado = Enunciado.new
	  @languages = Language.all
    @concurso_id = params[:concurso_id]
    @concurso = Concurso.find(@concurso_id)
  end

  def create	    
      @concurso = Concurso.find(params[:concurso_id])
      @enunciado = @concurso.enunciados.build(params[:enunciado])
    
      if params[:langs] && @enunciado.save
        #guarda as linguagens 
        params[:langs].each do |l|
  	      el = @enunciado.enunciadoLangs.build(:language_id=> l.to_i)
  	      el.save
        end
        flash[:success] = "Enunciado criado com sucesso!"
        redirect_to baterias_path(:enunciado_id=>@enunciado.id)
  	    createFolder
      else
        @title = "Novo enunciado"
    	  @languages = Language.all
        @concurso_id = params[:concurso_id]
        @array = Array.new
        if !params[:langs]
          @enunciado.errors.add "Linguagens:", "Tem de escolher pelo menos uma linguagem!"
        end
        render 'new'
      end
  end
  
	def destroy
	  @enunciado = Enunciado.find(params[:id])
	  con = @enunciado.concurso_id
	  @concurso = Concurso.find(@enunciado.concurso_id)
	  deleteFolder
      @enunciado.destroy
      redirect_back_or concurso_path(Concurso.find(con))
	end
	
	def newxml
	  @title = "Submissao de enunciados em formato XML"
	  @concurso_id = params[:concurso_id]
	  @concurso = Concurso.find(@concurso_id)
	  @enunciado = Enunciado.new
	  @erros = Array.new
  end
	
	
	def createxml
	  @concurso = Concurso.find(params[:concurso_id])
	  @erros = Array.new
	  
	  if params[:enunciado]
	    path = createFolderAndFile
  	  tryToDescompact (path)
  	  trataXML(path)
	  else 
      @title = "Submissao de enunciados em formato XML"
      @enunciado = Enunciado.new
      flash.now[:error] = "Nao selecionou nenhum ficheiro para submissao."
      render '/enunciados/newxml',:concurso_id=>@concurso.id
    end
  end
	  
	  
	

  private 
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

  	#verifica se e admin ou um participante e ainda em tempo de participacao
  	def admin_or_validParticipant
  	  concurso = Concurso.find(Enunciado.find(params[:id]).concurso_id)
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
    
####################   ####################   ####################   ####################       	
  	def createFolder
  		path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s,"en-"+@enunciado.id.to_s)
  		if !File.exists?(path)
  			Dir.mkdir(path)
  		end
  	end
	
  	def deleteFolder
  		path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s,"en-"+@enunciado.id.to_s)
  		if File.exists?(path)
  			`rm -rf #{path}`
  		end
  	end
	
####################   ####################   ####################   ####################   
	#cria a pasta temporaria para 
  def createFolderAndFile
    #timestamp
		t = DateTime.now
		
		# cria o caminho físico do arquivo
		filename = params[:enunciado][:blob].original_filename
		path = File.join(Rails.root, "data/temp")
		#completa o path com o nome do ficheiro
		
		#cria a pasta caso nao exista (temp)
		if !File.exists?(path)
			Dir.mkdir(path)
		end
		
		path = File.join(path,"subXml"+t.to_s(:number))
		#cria a pasta caso nao exista (o ou os ficheiros xml)
		if !File.exists?(path)
			Dir.mkdir(path)
		end
		
		path = File.join(path,filename)
		
		# escreve o arquivo no local designado
		File.open(path, "wb") do |f| 
			f.write(params[:enunciado][:blob].read)
		end
		
		return path
  end
  
  #descompacta caso o ficheiro venha comprimido
  def tryToDescompact (path)
    dir = File.dirname(path)
    file = File.basename(path)
    #ext = File.extname(path)
        
    case params[:enunciado][:blob].content_type
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
	
####################   ####################   ####################   ####################   	
#Parte referente a submissao do xml

  def trataXML(path)
    files = Dir.glob(File.dirname(path)+"/*.xml")

    #se nao houver ficheiros xml, sai e mostra erro
    if files.size == 0
      @enunciado = Enunciado.new
  	  removeFolder(path)
      flash[:error] = "Nenhum dos ficheiros submetidos esta no formato xml."
      render '/enunciados/newxml',:concurso_id=>@concurso.id
      return
    end

    files.each do |xml_file_path|
      ##IMPORTANTE antes de fazer a tentativa valta validar com o XSD
      parseEnunciadoXML(xml_file_path)
    end
    
    
  	removeFolder(path)
    if @erros.empty?
      flash.now[:success] = "#{files.size} enunciado(s) submetido(s) com sucesso."
      if !@alert.empty?
        flash.now[:notice] = "Importante: "+@alert
      end
      render '/enunciados/newxml',:concurso_id=>@concurso.id
    else 
      if !@success.empty?
        @erros << "Os seguintes ficheiros foram adicionados sem problemas: "+@success
      end
      render '/enunciados/newxml',:concurso_id=>@concurso.id
  	end

  end

  #faz parse do ficheiro xml, adiciona a tentativa e os resultados a BD
  def parseEnunciadoXML(xml_file_path)
    xml_data = ""
    @alert = ""
    @success = ""
     
    file = File.new(xml_file_path,"r")
    if file
      file.each_line do |line| xml_data+= line end
    end 


    doc = REXML::Document.new( xml_data )
    tit = ""
    REXML::XPath.each( doc, "//Titulo" ){ |titulo_element|
      tit = titulo_element.text
    }
    des = ""
    REXML::XPath.each( doc, "//Descricao" ){ |desc_element|
      des = desc_element.text
    }
    p = 0
    REXML::XPath.each( doc, "//Peso" ){ |peso_element|
      p = peso_element.text.to_i
    }
    fun = ""
    REXML::XPath.each( doc, "//Func" ){ |func_element|
      fun = func_element.text
    }
  
    #vai buscar o id da funcao de avaliaçao, se nao existir cria-a
    function = Function.where(:func=>fun).first
    if function
      f_id = function.id
    else
      function = Function.new(:func=>fun)
      function.save
      f_id = function.id
      func_name= function.func
      @alert += "A funcao de avaliacao [#{func_name}] foi criada no processo!"
    end

    #cria e guarda o enunciado
    @enunciado = @concurso.enunciados.build(:titulo=>tit,
                                            :desc=>des,
                                            :funcao_id=>f_id,
                                            :peso=>p)
    
    basename = File.basename(xml_file_path)
    if !@enunciado.save
       err = "O enunciado contido no ficheiro #{basename} nao foi criado porque continha os seguintes erros:   "
       @enunciado.errors.full_messages.each do |msg|
         err += msg + ";  "
       end
       @erros << err
    else
      @success +=basename+ "  " 

      #cria e guarda linguagens
      REXML::XPath.each( doc, "//Linguagem" ){ |linguagem_element|
        l = Language.where(:ling=>linguagem_element.text).first
        el = EnunciadoLang.new
        el = @enunciado.enunciadoLangs.build(:language_id=>l.id)
        el.save
      }

      #cria e guarda os testes
      n= ""
      inp = ""
      out = ""
      REXML::XPath.each( doc, "//Teste" ){ |teste_element|
        teste_element.each_element do |e|
          case e.name
            when "Nome"
              n = e.text
            when "Input"
              inp = e.text
            when "Output"
              out = e.text
          end
        end
        @bateria = Bateria.new
        @bateria = @enunciado.baterias.build(:nome=>n,:input=>inp,:output=>out) 
        @bateria.save       
      }    	  
  	end

  
  end
  
  
  def removeFolder(path)
    newPath = File.dirname(path)
		if File.exists?(newPath)
			`rm -rf #{newPath}`
		end
  end
  	  
end
