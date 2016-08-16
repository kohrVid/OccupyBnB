class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_squatter!, if: :devise_controller?
#  skip_before_filter :require_no_authentication
  protect_from_forgery with: :exception

  include Devise::Controllers::Helpers


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

end
