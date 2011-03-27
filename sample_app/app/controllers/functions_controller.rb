class FunctionsController < ApplicationController
  before_filter :admin_user,   :only => [:new, :destroy, :create,:index,:edit,:update]
  before_filter :authenticate
  
  def index
    @title = "Todos as funções de avaliacão"
    @functions = Function.paginate(:page => params[:page])
  end
  
  def new
    @title = "Nova função de avaliação"
    @function = Function.new
  end
  
  def create
    @function = Function.new(params[:function])
    if @function.save
      flash[:success] = "Funcão criada com sucesso!"
      redirect_to functions_path
    else
      @title = "Nova funcao de avaliacao"
      render 'new'
    end
  end
  
  def edit
    @title = "Editar função"
    @function = Function.find(params[:id])
  end
  
  def update
    @function = Function.find(params[:id])

     if @function.update_attributes(params[:function]) 	       
       flash[:success] = "Função alterada com sucesso."
       redirect_to functions_path
     else
       @title = "Editar Função."
       render 'edit'
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
