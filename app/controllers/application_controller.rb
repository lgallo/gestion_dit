class ApplicationController < ActionController::Base
  include SessionsHelper
  
  protect_from_forgery
  
  before_filter :chequear_login
  
  def chequear_login
    unless logueado?
      redirect_to '/signin'
    end
  end
  
end