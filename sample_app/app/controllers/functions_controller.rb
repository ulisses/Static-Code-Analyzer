class FunctionsController < ApplicationController
  before_filter :admin_user,   :only => [:new, :destroy, :create,:index]
  before_filter :authenticate
  
  def index
    @title = "Todos as funcoes de avaliacao"
    @functions = Function.paginate(:page => params[:page])
  end
  
  def new
    @title = "Nova funcao de avaliacao"
    @function = Function.new
  end
  
  def create
    @function = Function.new(params[:function])
    if @function.save
      flash[:success] = "Funcao criada com sucesso!"
      redirect_to functions_path
    else
      @title = "Nova funcao de avaliacao"
      render 'new'
    end
  end

  def destroy
    Function.find(params[:id]).destroy
    redirect_back_or functions_path
  end


  private 
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end
