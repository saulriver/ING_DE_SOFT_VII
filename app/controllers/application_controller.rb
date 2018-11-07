class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #before_action :authenticate_user!
  #, :except => [:show, :index]
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end
end
