module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Software para Analise e Avaliacao de Programas"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("images.jpg", :alt => "Sample App", :class => "round")
  end
  
  
end
