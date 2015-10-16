class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_up_path_for(resources)
  		'/places'
  end

	def after_sign_in_path_for(resources)
		'/places'
	end

	# def admin

	# end

	def authenticate_admin!
		unless current_user[params[:admin]] == true
			
		end
	end


end
