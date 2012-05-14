module ApplicationHelper

  def li_menu(controller, texto)
    raw "<li #{'class="active"' if controller==params[:controller]}>#{link_to texto, :controller => controller, :action => 'index' }</li>"
  end
  
  def shorten(text, length)
    text[0, length].concat(' (...)') unless text.nil? or text.empty? or text.length <= length
  end
  
  def pretty_date(value)
    if value.nil?
      '-'
    else
      value.year == Time.now.year ? I18n.localize(value, :format => '%d %b') : I18n.localize(value, :format => '%d %b %Y')
    end
  end
  
  def select_meses(form_builder, campo)
    form_builder.select campo, MESES
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    up_or_down = (column == sort_column && sort_direction == "asc") ? "down" : "up"
    
    if column == sort_column
      title = raw("#{title}<li class='icon-chevron-#{up_or_down}'></li>")
    end
    
    content_tag("th", title, :"data-link" => url_for(params.merge(:sort => column, :direction => direction, :page => nil)), :class => "header multiSort")
  end
end
