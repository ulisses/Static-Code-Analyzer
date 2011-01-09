class EnunciadosController < ApplicationController
  before_filter :admin_user,   :only => [:edit, :update, :new, :destroy, :create]
  before_filter :admin_or_validParticipant, :only => [:show]
  before_filter :authenticate  
  
  def show
	@title = "Enunciado"
	@enunciado = Enunciado.find(params[:id])
	@concurso = Concurso.find(@enunciado.concurso_id)
	@function = Function.find(@enunciado.funcao_id)
	@language = Language.find(@enunciado.linguagem_id)		
	@tentativa = Tentativa.new
  end

  def new
    @title = "Novo enunciado"
    @enunciado = Enunciado.new
    @concurso_id = params[:concurso_id]
    @array = Array.new
  
 #   @enunciado.testes.build # cria um teste
  end

  def create
	params[:enunciado][:funcao_id] = params[:funcao_id]
	params[:enunciado][:linguagem_id] = params[:linguagem_id]
	params[:enunciado][:peso] = params[:peso]
	
    @concurso = Concurso.find(params[:concurso_id])
    @enunciado = @concurso.enunciados.build(params[:enunciado])
    
  #  params[:testes].each_value { |teste| @enunciado.testes.build(teste) }##constroi os testes
    
    if @enunciado.save
      flash[:success] = "Enunciado criado com sucesso!"
      redirect_to tests_path(:enunciado_id=>@enunciado.id)
	  createFolder
    else
      @title = "Novo enunciado"
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
	
#	def add_teste
#    @teste = Teste.new
#  end

  private 
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
	
	def createFolder
		path = File.join(Rails.root, "data/concursos",@concurso.id.to_s,"enunciados")
		if !File.exists?(path)
			Dir.mkdir(path)
		end
		
		path = File.join(Rails.root, "data/concursos",@concurso.id.to_s,"enunciados",@enunciado.id.to_s)
		
		if !File.exists?(path)
			Dir.mkdir(path)
		end
	end
	
	def deleteFolder
		path = File.join(Rails.root, "data/concursos",@concurso.id.to_s,"enunciados",@enunciado.id.to_s)
		if File.exists?(path)
			`rm -rf #{path}`
		end
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
	
    
end
