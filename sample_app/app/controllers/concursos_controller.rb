class ConcursosController < ApplicationController
   before_filter :admin_user,   :only => [:edit, :update, :new, :destroy, :create, :stats, :downloadMetrics, :generateMetrics,
     :downloadResults, :generateResults]
   before_filter :authenticate
   before_filter :concursoInactivo, :only => [:downloadMetrics, :generateMetrics, :downloadResults, :generateResults]
  
   #define exercise struct, with an id, a grade, and a percentage
   Exercise = Struct.new( :id, :result )
   
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
  
  
  #generate metrics file
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
                 :disposition =>'attachment') ##download
                 #:disposition =>"inline") #ver no browser
  end
  
    # Stream a file to client
    def viewMetrics
      @concurso =  Concurso.find(params[:concurso_id])
      path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s,"metrics","metrics.pdf")
      send_file(   path,
                   :filename => "metrics.pdf",
                   :type => "application/pdf",
                   :stream => "false",
                   #:disposition =>'attachment') ##download
                   :disposition =>"inline") #ver no browser
    end
  
  #generate results file
  def generateResults
    @concurso =  Concurso.find(params[:concurso_id])
    @title = "Todos os concursos"
    @erros = ""
    resultsCommand()
    flash[:error] = @erros unless @erros.eql? ""
    redirect_to concursos_path
  end
  
    # Stream a file to client
    def downloadResults
      @concurso =  Concurso.find(params[:concurso_id])
      path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s,"results","results.pdf")
      send_file(   path,
                   :filename => "results.pdf",
                   :type => "application/pdf",
                   :stream => "false",
                   :disposition =>'attachment') ##download
  #                 :disposition =>"inline") #ver no browser
    end
    
    # Stream a file to client
    def viewResults
          @concurso =  Concurso.find(params[:concurso_id])
          path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s,"results","results.pdf")
          send_file(   path,
                       :filename => "results.pdf",
                       :type => "application/pdf",
                       :stream => "false",
   #                    :disposition =>'attachment') ##download
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
	  
	  #verifica se o concurso esta inactivo
    def concursoInactivo
      conc = Concurso.find(params[:concurso_id])
      (conc.inicio<=DateTime.now && conc.fim>=DateTime.now) ? false : true
    end
		  
		def resultsCommand
		  path = File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s,"results")
			if File.exists?(path)
				`rm -rf #{path}`
			end
			
			if !File.exists?(path)
				Dir.mkdir(path)
			end
			
			#####COLOCAR AQUI COMANDO QUE CRIA O PDF NESTA PASTA
			#File.new(path+"/results.pdf", "w")
			path= File.join(Rails.root, "data/concursos","contest-"+@concurso.id.to_s,"results","results.tex")
			
			compileBestResults(path)
	  end
	  
	  def compileBestResults(path)
      #get all results
	    allResults = Result.where(:concurso_id=>@concurso.id)
	    #hash with hashes for each user
	    hash = Hash.new("empty")
	    #number of exercises of the contest
      allExercises = Enunciado.where(:concurso_id=>@concurso.id).order('id ASC')
      #number of exercises of the contest
      numExerc = allExercises.size


      #iterate trough results to fill an hash with the results for each user
	    allResults.each do |res|
	      #get all important values
	      enunciado_id = res.enunciado_id
	      result = res.bestRes
	      group = User.find(res.user_id).name

	      enunciado = Enunciado.find(enunciado_id)
	      nomeEnunciado = enunciado.titulo
	      peso = enunciado.peso
        
        #create Exercise
        exercise = Exercise.new(enunciado_id, result)
        
	      #save values on hash
	      if hash[group].eql? "empty"
	        hash[group] = [exercise]
        else
          hash[group] << exercise
	      end  
      end
	      
     createLatex(allExercises,hash,numExerc,path)
     createPDF(path)
    end
    
    def createLatex(allExercises,hash,numExerc,path)
      #create top of latex document
      string= "\\documentclass[12pt]{article}\n"
      string+= "\\usepackage[utf8]{inputenc}"
      string+= "\\begin{document}\n"
      string+= "\\begin{table}[ht]\n"
#      string+= "\\section{Resultados do concurso #{@concurso.tit}}"
      string+= "\\Large Resultados do concurso:  \\textbf{#{@concurso.tit}} \\normalsize\\\\ \n\n"
      allExercises.each do |exerc|
        string+= "Exercício #{exerc.id}: #{exerc.titulo}\\\\ \n"
      end
      string+="\n"
#    	string+= "\\caption{Nonlinear Model Results}\n"
#    	string+= "\\centering\n"
    	string+= "\\begin{tabular}{|"
    	numColumns = numExerc + 2
    	numColumns.times do |n|
    	  string+="c"
    	  string+= " | " unless n == numColumns-1
  	  end

    	string+= "| }\n"
    	string+= "\t\\hline\\hline\n"
    	string+= "Grupo"
    	allExercises.each do |e|
    	  string+= " & Ex. #{e.id} (#{e.peso}\\%) "
  	  end
  	  string+= "& Total"
    	string+=" \\\\ [0.5ex]\n"
    	string+= "\t\\hline\n"

      iterations = 0
      maxIter = hash.size
    	#go through all groups
      hash.each do |key, value| 
        calcRes = 0
        total = 0
        string+= "#{key}"
        #go through all exercises
        allExercises.each do |ex|
          aux = 0 
          value.each do |v|
            if ex.id == v.id  
              calcRes = (v.result * ex.peso)/100
              total+= calcRes 
              string+= " & #{calcRes}"
              aux = 1
            end
          end
          string+= " & 0" unless aux == 1
        end
        string+=" & #{total} \\\\\n"
        iterations+=1
        string+= "\t \\hline\n" unless iterations >= maxIter 
      end

      ##end table
      string+= "[1ex] \n"
      string+= "\t\\hline\n"
      string+= "\\end{tabular}\n"
      string+= "\\label{table:nonlin}\n"
      string+= "\\end{table}\n"
      ##end latex document
      string+= "\\end{document}\n"
      
      #write to file
      File.open(path, "wb") do |f| 
  			f.write(string)
  		end
    end
    
    
    def createPDF(path)
      dir = File.dirname(path)
      
      #aux variables      
      out1 = 0,out2 = 0
      #thread that creates pdf
      t1 = Thread.new do
        out1 = system("cd #{dir} && pdflatex results.tex")
        out2 = system("cd #{dir} && rm *.log  *.tex *.aux")
      end
      
      
      #thread that kills the pdf creation if it takes too long
      timer = Thread.new do
        sleep 3
        if t1.alive?
          Thread.kill(t1)
          @erros= "Ocorreu um erro na geração do relatorio (PDF) dos resultados!"
        end
      end
      
      t1.join
      if timer.alive?
        Thread.kill(timer)
      end
      timer.join
      
      if (out1==0 || out2==0) 
        @erros= "Ocorreu um erro na geração do relatorio (PDF) dos resultados!"
      end
      
    end
		
end
