class ParticipantesController < ApplicationController
  before_filter :authenticate, :only => [:create]
  before_filter :admin_user, :only => [:destroy]
  
  def index
    @concurso_id = params[:concurso_id]
    @participantes = Concurso.find(@concurso_id).participantes.paginate(:page => params[:page])
  end

  
  def create
    @concurso = Concurso.find(params[:participante][:concurso_id])
    @participante = @concurso.participantes.build(params[:participante])
    if params[:participante][:chave] == @concurso.chave
      if @participante.save
        flash[:success] = "Sucesso. Pode comecar a participar no concurso!"
        redirect_to concurso_path(@concurso)
      else
        render 'concursos/show'
      end
    else
      flash.now[:error] = "Chave incorrecta!"
      render 'concursos/show'
    end
  end
  
  def destroy
    redirect_back_or @participantes.first.concurso
    Participante.find(params[:id]).destroy
  end


  private 
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end
