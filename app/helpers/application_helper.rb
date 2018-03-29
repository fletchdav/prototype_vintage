module ApplicationHelper
  def print_color_palette(colors)
    color_string = ''
    colors.each do |c|
      color_string += content_tag :span, ' ', style: "display: block; float: left;  width: 33px; height: 33px; background: #{c.to_hex}"
    end
    content_tag :div, color_string.html_safe, style: "display: inline-block;"
  end

  def print_color_palette_rgb(colors)
    color_string = ''
    colors.each do |c|
      color_string += content_tag :span, ' ', style: "display: block; float: left;  width: 33px; height: 33px; background: RGB(#{c.r.to_i},#{c.g.to_i},#{c.b.to_i})"
    end
    content_tag :div, color_string.html_safe, style: "display: inline-block;"
  end
end
