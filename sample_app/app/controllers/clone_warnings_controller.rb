class CloneWarningsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user
  
  
  def index
    @title = "Clone Warnings"
    @clone_warnings = CloneWarning.order('created_at ASC').paginate(:page => params[:page])
  end
  
  def present
  	@codigo = Array.new
  	file = File.new(params[:file],"r")
    if file
      file.each_line do |line| @codigo << line end
    end
  end
  
  def destroy
    CloneWarning.find(params[:id]).destroy
    flash[:success] = "Warning eliminado."
    redirect_to clone_warnings_path
  end
  
  
  private
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
  
  
end