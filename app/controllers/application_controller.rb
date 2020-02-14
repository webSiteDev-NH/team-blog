class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:team_name, :representative])
    devise_parameter_sanitizer.permit(:account_update, keys: [:team_name, :representative])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:facility_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:facility_name, :address, :phone_number, :start_time, :holiday_start_time, :holiday_close_time, :close_time, :access, :courts, :url, :facebook, :twitter, :instagram, :image, :latitude, :longitude])
  end
    
end
