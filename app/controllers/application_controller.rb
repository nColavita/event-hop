class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_up_path_for(resources)
  		'/places'
  end

	def after_sign_in_path_for(resources)
		'/places'
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:account_update) { |params|
	    params.permit(
	      :email, :password, :password_confirmation, :fname,
	      :lname, :current_password, :profilepic
	    )
	  }
	end

	def authenticate_admin!
		unless current_user[params[:admin]] == true
			
		end
	end

end
