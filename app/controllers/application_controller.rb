class ApplicationController < ActionController::Base
	include Pundit

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
	     devise_parameter_sanitizer.permit(:sign_up, keys: [:matricula])
	     devise_parameter_sanitizer.permit(:sign_up, keys: [:licenciatura])
			 devise_parameter_sanitizer.permit(:sign_up, keys: [:inicio_ano])
	     devise_parameter_sanitizer.permit(:sign_up, keys: [:termino_ano])
	     devise_parameter_sanitizer.permit(:sign_up, keys: [:cargahoraria])
			 devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
	     devise_parameter_sanitizer.permit(:account_update, keys: [:nome])
	     devise_parameter_sanitizer.permit(:account_update, keys: [:matricula])
	     devise_parameter_sanitizer.permit(:account_update, keys: [:licenciatura])
	     devise_parameter_sanitizer.permit(:account_update, keys: [:inicio_ano])
			 devise_parameter_sanitizer.permit(:account_update, keys: [:termino_ano])
	     devise_parameter_sanitizer.permit(:account_update, keys: [:cargahoraria])
			 devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
 	end
end
