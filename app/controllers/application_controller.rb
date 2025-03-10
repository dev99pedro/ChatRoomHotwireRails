class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permite o campo 'login' no registro e na atualização do usuário
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login])
  end


  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redireciona para a página de login
  end
end
