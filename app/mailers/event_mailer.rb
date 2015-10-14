class EventMailer < ActionMailer::Mailer
	default from: "wennyx3@gmail.com"
	default to: "leahwchang@gmail.com"

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
	end

	# def new_user(user)
	# 	@user = user
	# 	mail(subject: "New User: #{user.email}")
	# end

	# def welcome_email(user)
	#     @user = user
	#     @url  = 'http://example.com/login'
	#     mail(to: @user.email, subject: 'Welcome to My Awesome Site')
 	#  	end

	def invitation(event)
		@event = event
		template_name = "event-hop-test-invitation"
		template_content = []
		message = {
			to: [{email: "leahwchang@gmail.com"}, {email: "wennyx3@gmail.com"}],
			subject: "Invitation from #{user.email}",
			merge_vars: [{rcpt: "leahwchang@gmail.com", vars: [{name: "EVENT_NAME", content: event.name}]
				}
			]
		}

	mandrill_client.messages.send_template template_name, template_content, message

	end


	
end
