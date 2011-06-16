class ConcursosController < ApplicationController
   before_filter :admin_user,   :only => [:edit, :update, :new, :destroy, :create, :stats]
   before_filter :authenticate
  
  def index
    @title = "Todos os concursos"
    @concursos = Concurso.paginate(:page => params[:page])
  end
  
  def new
    @title = "Novo concurso"
    if signed_in?
      if current_user.admin?
        @concurso = Concurso.new 
      end
    end  
  end

  def create
    @concurso = current_user.concursos.build(params[:concurso])
    if @concurso.save
      flash[:success] = "Concurso criado com sucesso!"
      redirect_to concursos_path
    else
      @title = "Novo concurso"
      render 'new'
    end
	
	createFolder
  end
  
  def edit
    @title = "Editar concurso"
    @concurso = Concurso.find(params[:id])
  end

  def update
     @concurso = Concurso.find(params[:id])
     
     if @concurso.update_attributes(params[:concurso]) 	       
       flash[:success] = "Concurso alterado com sucesso."
       redirect_to @concurso
     else
       @title = "Editar concurso."
       render 'edit'
     end
   end
  
  def show
    @concurso = Concurso.find(params[:id])
    @title = @concurso.tit

    @participante = Participante.new 
  
    if(current_user.admin? || (( participante(@concurso) && tRestante(@concurso)>0 ) ) )
        @enunciados = @concurso.enunciados
    else
        @enunciados = nil
    end
    
  end

  def destroy
	  @concurso = Concurso.find(params[:id])
	  deleteFolder
    @concurso.destroy
    redirect_back_or concursos_path
  end
  
  def stats
    @title = "Stats1"
    
    if params[:concurso_id]
      @concurso = Concurso.find(params[:concurso_id])
      dir = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s)
      dirStatsComplete = File.join(Rails.root,"public/images/stats/","contest-"+@concurso.id.to_s)
      dirStatsParcial = File.join("/images/stats/","contest-"+@concurso.id.to_s)        
      files = Dir.glob(dirStatsComplete+"/*")
      
      #se não existirem os 3 ficheiros de estatística, ou se for um pedido de refresh, criar os ficheiros
      @ok = true
      if files.size < 3 || params[:refresh] == true
        #cria o comando que chama o script perl count.pl
        scriptCommand =  "perl count.pl -open #{dir} -perc -out pre -path #{dirStatsComplete} "
        
        #executa o comando
        @ok = system("cd data/scripts && #{scriptCommand} ")
        
        #verifica se o comando gerou 3 ficheiros
        files = Dir.glob(dirStatsComplete+"/*")
        if !files.size == 3
          @ok = false
        end
        
      end

      @imagePath1 = File.join(dirStatsParcial,"pre_FilesPerLanguage.png")  
      @imagePath2 = File.join(dirStatsParcial,"pre_RatioFilesLines.png")  
      @imagePath3 = File.join(dirStatsParcial,"pre_LinesPerLanguage.png")
    end
    @cenas = File.join(Rails.root, "public/images/stats","contest-"+@concurso.id.to_s)
    
  end
  
  
  
  def generateMetrics
    @concurso =  Concurso.find(params[:concurso_id])
    @title = "Todos os concursos"
    
    metricsCommand()
    redirect_back_or concursos_path
  end

  # Stream a file to client
  def downloadMetrics
    @concurso =  Concurso.find(params[:concurso_id])
    path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s,"metrics","metrics.pdf")
    send_file(   path,
                 :filename => "metrics.pdf",
                 :type => "application/pdf",
                 :stream => "false",
#                 :disposition =>'attachment') ##download
                 :disposition =>"inline") #ver no browser
  end
  
  
  private 
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
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

				
		def createFolder
			path = File.join(Rails.root, "data/")
			if !File.exists?(path)
				Dir.mkdir(path)
			end
		
			path = File.join(Rails.root, "data/concursos")
			if !File.exists?(path)
				Dir.mkdir(path)
			end
			
			path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s)
			if !File.exists?(path)
				Dir.mkdir(path)
			end

      #para as stats
      path = File.join(Rails.root, "public/stats")
			if !File.exists?(path)
				Dir.mkdir(path)
			end
			
			path = File.join(Rails.root, "public/images/stats","contest-"+@concurso.id.to_s)
			if !File.exists?(path)
				Dir.mkdir(path)
			end
			
		end
	
		def deleteFolder
			path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s)
			if File.exists?(path)
				`rm -rf #{path}`
			end
			
			path = File.join(Rails.root, "public/images/stats","contest-"+@concurso.id.to_s+"")
			if !File.exists?(path)
				`rm -rf #{path}`
			end
		end
		
		def metricsCommand
		  path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s,"metrics")
			if File.exists?(path)
				`rm -rf #{path}`
			end
			
			if !File.exists?(path)
				Dir.mkdir(path)
			end
			
			#####COLOCAR AQUI COMANDO QUE CRIA O PDF NESTA PASTA
			File.new(path+"/metrics.pdf", "w")
			
	  end
		  
		
		
end
