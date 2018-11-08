class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #before_action :authenticate_user!
  #, :except => [:show, :index]
  #layout false
  #para que las vistas de devise se dirijan al
  #layout devise.html.erb  
  layout :layout_by_resource

  protected
  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name != "edit"
      "devise"
    else
      "application"
    end
  end

#def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
#end
end
