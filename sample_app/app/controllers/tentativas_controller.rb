class TentativasController < ApplicationController
    before_filter :admin_or_validParticipant, :only => [:create]
    before_filter :authenticate
    
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
  	  params[:tentativa][:user_id] = params[:user_id]
	   
    	auxPath
    	compileAndExecute

    	@tentativa = @enunciado.tentativas.build(params[:tentativa])
      if @tentativa.save
        flash[:success] = "Tentativa submetida com sucesso!"
        redirect_to @tentativa
      else
        @title = "Enunciado"
        render @enunciado
      end
    else
      flash[:error] = "Nao selecionou nenhum ficheiro para submissao!"
      redirect_to @enunciado
    end      
  end

  def destroy
  end

  def show
	@tentativa = Tentativa.find(params[:id])
	@enunciado = Enunciado.find(@tentativa.enunciado_id)
  end
  
  
  
  private
	def auxPath
		#timestamp
		t = DateTime.now

		# cria o caminho físico do arquivo
		filename = t.to_s(:number) + "-" + params[:tentativa][:path].original_filename
		path = File.join(Rails.root, "data/concursos",@enunciado.concurso_id.to_s,"/enunciados",@enunciado.id.to_s,"user-"+current_user.id.to_s)
		#completa o path com o nome do ficheiro
		path = File.join(path,filename)

		#cria a pasta caso nao exista
		if !File.exists?(File.dirname(path))
			Dir.mkdir(File.dirname(path))
		end
		
		# escreve o arquivo no local designado
		File.open(path, "wb") do |f| 
			f.write(params[:tentativa][:path].read)
		end
		
		#guarda na @tentativa.path o path onde ficou guardado o ficheiro
		params[:tentativa][:path] = path

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
  
  
  
end
