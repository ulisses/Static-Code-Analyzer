class ResultsController < ApplicationController
  def index
    if params[:concurso_id] && params[:user_id]
      @user = User.find(params[:user_id])
      @results = @user.results.where(:concurso_id=>params[:concurso_id]).order('created_at DESC').paginate(:page => params[:page],:per_page=>10)
      @concurso = Concurso.find(params[:concurso_id])
    else
      if params[:concurso_id]
        @users = User.all
        @concurso = Concurso.find(params[:concurso_id])
        @results = Array.new
        @users.each do |user|
          @results += user.results.where(:concurso_id=>params[:concurso_id]).order('created_at DESC')
        end
        @results = @results.paginate(:page => params[:page],:per_page=>10)
      else
         if params[:user_id]  
           @user = User.find(params[:user_id])
           @results = @user.results.order('created_at DESC').paginate(:page => params[:page],:per_page=>10 )
         else
           @users = User.all
           @results = Array.new
           @users.each do |user|
             @results += user.results.order('created_at DESC')
           end
           @results = @results.paginate(:page => params[:page],:per_page=>10)
         end
      end
    end
  end
  
  
  
end