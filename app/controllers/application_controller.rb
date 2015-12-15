class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def index
	end

	before_filter :configure_permitted_parameters, if: :devise_controller?
	before_filter :set_locale

	protected

	###
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:name, :gender, :language_learn, :language_speak, :brief,  :email, :password, :password_confirmation, :avatar)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			if [:password, :password_confirmation] == ""
				u.permit(:name, :gender, :language_learn, :language_speak, :brief, :email, :current_password, :avatar)
			else
				u.permit(:name, :gender, :language_learn, :language_speak, :brief, :email, :password, :password_confirmation, :current_password, :avatar)
			end
		end
	end

	def set_locale
		if session[:locale]
			I18n.locale = session[:locale]
		end
	end

	# 회원탈퇴코드 : edit.html.erb 에서 가져다 놓음
	#<h3>Cancel my account</h3>
	#<p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), data: { confirm: "Are you sure?" }, method: :delete %></p>

	#아바타

	#yoonbok

end
