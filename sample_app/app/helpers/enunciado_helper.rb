module EnunciadoHelper
  
  
  def arrayFunc
    array = Array.new
    Function.all.each do |f|
      array << [f.func,f.id]
    end
    return array
  end

  def nums
    array = Array.new
    (0..100).to_a.each do |n|
      array << [n,n]
    end
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
