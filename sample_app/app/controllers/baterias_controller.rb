class BateriasController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :only => [:edit, :update, :new, :destroy, :create,:show]

  def index
    @bateria = Bateria.new
    @title = "Testes"
    if params[:enunciado_id]
      @enunciado = Enunciado.find(params[:enunciado_id])
      @concurso = Concurso.find(@enunciado.concurso_id)
      @baterias = @enunciado.baterias.paginate(:page => params[:page])
    end
  end
  
  def create
    if params[:enunciado_id]
      @enunciado = Enunciado.find(params[:enunciado_id])
      assign_params

      @bateria = @enunciado.baterias.build(params[:bateria])
      if @bateria.save
        flash[:success] = "Teste adicionado com sucesso!"
        redirect_to baterias_path(:enunciado_id=>@enunciado.id)
      else
        @title = "Testes"
        render 'index'
      end
    else 
      redirect_to root_path
    end
  end
  
  def destroy
    @bateria = Bateria.find(params[:id])
    @enunciado = Enunciado.find(@bateria.enunciado_id)
    @bateria.destroy
    redirect_back_or baterias_path(:enunciado_id=>@enunciado.id)
  end
  
  def submit
    @sopa = sopa
  end
  
  
  private 
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def assign_params
      if (params[:bateria][:pathIn])
        guardaTemp(:pathIn,"input")
      end
      if (params[:bateria][:pathOut])
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
  			f.write(params[:bateria][param].read)
			end
  		
  		#leio o o ficheiro e guardo o res no parametro correcto
  		aFile = File.new(path, "r")
      if aFile
          contents = ""
          aFile.each_line do |line| 
             contents = contents + line
           end
                       flash[:error] = contents
          params[:bateria][p] = contents
      else
         puts "Unable to open file!"
      end
      
      #apaga o ficheiro temporario
  		File.delete(path) 
        if File.exist?(path)
      end
      
    end
    
end
