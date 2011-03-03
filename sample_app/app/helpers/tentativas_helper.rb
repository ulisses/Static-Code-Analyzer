module TentativasHelper

  #verifica se o concurso esta activo
  def concursoActivo(concurso)
    (concurso.inicio<=DateTime.now && concurso.fim>=DateTime.now) ? true : false
  end

end
