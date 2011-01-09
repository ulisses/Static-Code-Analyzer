class TestsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :only => [:edit, :update, :new, :destroy, :create,:show]

  def index
    @test = Test.new
    @title = "Testes"
    if params[:enunciado_id]
      @enunciado = Enunciado.find(params[:enunciado_id])
      @concurso = Concurso.find(@enunciado.concurso_id)
      @tests = @enunciado.tests.paginate(:page => params[:page])
    end
  end
  
  def create
    if params[:enunciado_id]
      @enunciado = Enunciado.find(params[:enunciado_id])
      assign_params

      @test = @enunciado.tests.build(params[:test])
      if @test.save
        flash[:success] = "Teste adicionado com sucesso!"
        redirect_to tests_path(:enunciado_id=>@enunciado.id)
      else
        @title = "Testes"
        render 'index'
      end
    else 
      redirect_to root_path
    end
  end
  
  def destroy
    @test = Test.find(params[:id])
    @enunciado = Enunciado.find(@test.enunciado_id)
    @test.destroy
    redirect_back_or tests_path(:enunciado_id=>@enunciado.id)
  end
  
  def submit
    @sopa = sopa
  end
  
  
  private 
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def assign_params
      if (params[:test][:pathIn])
        guardaTemp(:pathIn,"input")
      end
      if (params[:test][:pathOut])
        guardaTemp(:pathOut,"output")
      end
    end
    
    def guardaTemp(param,filename)
      p = filename
  		# cria o caminho físico do arquivo
  		t = DateTime.now
  		filename = t.to_s(:number) + filename
      path = File.join(Rails.root, "data/temp")
      path = File.join(path,filename)
      
      #cria a pasta caso nao exista
  		if !File.exists?(File.dirname(path))
  			Dir.mkdir(File.dirname(path))
  		end
      		
  		# escreve o arquivo no local designado
  		File.open(path, "wb") do |f| 
  			f.write(params[:test][param].read)
			end
  		
  		#leio o o ficheiro e guardo o res no parametro correcto
  		aFile = File.new(path, "r")
      if aFile
          contents = ""
          aFile.each_line do |line| 
             contents = contents + line
           end
                       flash[:error] = contents
          params[:test][p] = contents
      else
         puts "Unable to open file!"
      end
      
      #apaga o ficheiro temporario
  		File.delete(path) 
        if File.exist?(path)
      end
      
    end
    
end
