class LanguagesController < ApplicationController
  before_filter :admin_user,   :only => [:new, :destroy, :create,:index]
  before_filter :authenticate
  
  def index
    @title = "Todos as funcoes de avaliacao"
    @languages = Language.paginate(:page => params[:page])
  end
  
  def new
    @title = "Nova funcao de avaliacao"
    @language = Language.new
  end
  
  def create
    @language = Language.new(params[:language])
    if @language.save
      flash[:success] = "Funcao criada com sucesso!"
      redirect_to languages_path
    else
      @title = "Nova funcao de avaliacao"
      render 'new'
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
