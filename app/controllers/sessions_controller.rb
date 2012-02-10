class SessionsController < ApplicationController
  skip_before_filter :chequear_login
  
  def new
  end
  
  def create
    if params[:session][:clave_acceso] == CLAVE_ACCESO
      loguear
      redirect_to planificaciones_path
    else
      flash[:error] = 'La clave ingresada no es correcta'
      render 'new'
    end 
  end
  
  def destroy
    
  end
  
end
