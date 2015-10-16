class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
	before_action :store_location
  before_filter :configure_permitted_parameters, if: :devise_controller?

 	protected
	def store_location
		puts "Storing: #{params[:continue]}"
	    if params[:continue] # =~ /\/(events\/[0-9])\z/ # safelist
	        puts "it's a match"
	        session[:continue] = params[:continue]
	    end
	end

	def after_sign_in_path_for(resource)
	    puts "I found: #{session[:continue]}"
	    session.delete(:continue) || root_path
	end

	def after_sign_up_path_for(resources)
		if params[:destination]
			@event.users << current_user
			event_path(params[:destination])
		else
			places_path
		end
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
