module ConcursosHelper
  
  #verifica se o concurso esta activo
  def concursoActivo(concurso)
    (concurso.inicio<=DateTime.now && concurso.fim>=DateTime.now) ? true : false
  end
  
  #verifica se é participante, se for retorna-o
  def participante(concurso)
    aux = Participante.where(:user_id=>current_user.id , :concurso_id=>concurso.id).first
  end  
    
  #calcula hora do fim do concurso para o utilizador actual
  def terminaC(concurso)
    advanceMin = concurso.dur.hour*60 + concurso.dur.min
    return participante(concurso).dataRegisto.advance(:minutes=> advanceMin)
  end
  
  #calcula o tempo que resta ao utilizador logado para continuar a participar
  def tRestante(concurso)
    return ((terminaC(concurso) - DateTime.now) / 60)
  end
    
  #verifica se o ficheiro de metricas ja foi gerado
  def metricasGeradas(concurso)
    return File.exist? File.join(Rails.root, "data/concursos","contest-"+concurso.id.to_s,"metrics","metrics.pdf")    
  end
  
  #verifica se o ficheiro de resultados ja foi gerado
  def resultadosGerados(concurso)
    return File.exist? File.join(Rails.root, "data/concursos","contest-"+concurso.id.to_s,"results","results.pdf")    
  end

end
