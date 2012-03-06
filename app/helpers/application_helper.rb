module ApplicationHelper
  def select_meses(form_builder, campo)
    form_builder.select campo, MESES
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    
    if css_class == "asc"
      header_class = "headerSortDown"
    elsif css_class == "desc"
      header_class = "headerSortUp"
    end
    
    content_tag("th", title, :"data-link" => url_for(params.merge(:sort => column, :direction => direction, :page => nil)), :class => "header multiSort #{css_class}")
  end
end
