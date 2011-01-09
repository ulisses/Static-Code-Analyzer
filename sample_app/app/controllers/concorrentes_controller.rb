class ConcorrentesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :destroy]
  before_filter :authorized_user, :only => :destroy
  

  def new
    @title = "Novo concorrente"
    @concorrente = Concorrente.new if signed_in?
  end
  
  def create
    @concorrente  = current_user.concorrentes.build(params[:concorrente])
    if @concorrente.save
      flash[:success] = "Concorrente adicionado!"
      redirect_to current_user
    else
      render '/concorrentes/new'
    end
  end
  
  def destroy
      @concorrente.destroy
      redirect_back_or current_user
  end
  
  
  def edit
      @title = "Editar concorrente"
      @concorrente = Concorrente.find(params[:id])
  end

  def update
    @concorrente = Concorrente.find(params[:id])
    if @concorrente.update_attributes(params[:concorrente])
      flash[:success] = "Profile updated."
      redirect_back_or @concorrente.user
    else
      @title = "Editar concorrente"
      render 'edit'
    end
  end


  private

    def authorized_user
      @concorrente = Concorrente.find(params[:id])
      redirect_to current_user unless (current_user?(@concorrente.user) || current_user.admin?)
    end

end
