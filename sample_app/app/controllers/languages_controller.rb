class LanguagesController < ApplicationController
  before_filter :admin_user,   :only => [:new, :destroy, :create,:index,:edit,:update]
  before_filter :authenticate
  
  def index
    @title = "Todos as linguagens"
    @languages = Language.paginate(:page => params[:page])
  end
  
  def new
    @title = "Nova linguagem de programação"
    @language = Language.new
  end
  
  def create
    @language = Language.new(params[:language])
    if @language.save
      flash[:success] = "Linguagem criada com sucesso!"
      redirect_to languages_path
    else
      @title = "Nova linguagem de programação"
      render 'new'
    end
  end

  def edit
    @title = "Editar linguagem"
    @language = Language.find(params[:id])
  end
  
  def update
    @language = Language.find(params[:id])

     if @language.update_attributes(params[:language]) 	       
       flash[:success] = "Linguagem alterada com sucesso."
       redirect_to languages_path
     else
       @title = "Editar Linguagem."
       render 'edit'
     end
  end
  
  def destroy
    Language.find(params[:id]).destroy
    redirect_back_or languages_path
  end


  private 
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end
