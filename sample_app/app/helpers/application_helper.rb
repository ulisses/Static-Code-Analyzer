module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Submissão Online para Análise de Software"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("sopas1.jpg", :alt => "Sample App", :class => "round")
  end
  
  
end
