class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

    protected
  def user_params
    params.require(:user).permit(:firstname, :lastname, :admin)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:firstname, :lastname, :admin]
  end
end
