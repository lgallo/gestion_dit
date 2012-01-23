module AplicacionesHelper
  
  def li_menu(controller, texto)
    raw "<li #{'class="selected"' if controller==params[:controller]}>#{link_to texto, :controller => controller, :action => 'index' }</li>"
  end
  
end
