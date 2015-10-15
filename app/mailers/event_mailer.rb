class EventMailer < ActionMailer::Base

	def invitation(current_user, email, event)
		@event = event
		@current_user = current_user
		mail(to: email,
			from: "services@eventhop.com",
			subject: "Invitation from eventhop"
		)
	end
end

