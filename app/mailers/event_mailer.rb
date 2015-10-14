class EventMailer < ActionMailer::Base

	def invitation(current_user, email)
		mail(to: email,
			from: "services@mydomain.com",
			subject: "Invitation",
			body: "You are invited to event name"
		)
	end
end
