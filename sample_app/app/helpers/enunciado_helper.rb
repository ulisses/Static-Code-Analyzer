module EnunciadoHelper
  
  
  def arrayFunc
    array = Array.new
    Function.all.each do |f|
      array << [f.func,f.id]
    end
    return array
  end
  
  def arrayLang
    array = Array.new
    @languages.each do |l|
      array << [l.ling,l.id]
    end
    return array
  end

  def nums
    array = Array.new
    (0..100).to_a.each do |n|
      array << [n,n]
    end
  end

  def temps
    array = Array.new
    inicio = 0.1
    while (inicio <= 4) do
      array << [inicio,inicio]
      inicio = (inicio + 0.1).round(1)
    end
    return array
  end
  
  def languageIsOnEnunciado (language)
    @myLanguages.each do |myL|
      if myL.language_id == language.id
        return true
      end
    end 
    return false
  end
  
end
