class ApplicationController < ActionController::Base
  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    user_url(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password confirm_password])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email bio password confirm_password])
  end
end
