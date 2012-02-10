module SessionsHelper
  
  def logueado?
    session[:logueado]
  end
  
  def loguear
    session[:logueado] = true
  end
  
  def desloguear
    session[:logueado] = false
  end
  
end
