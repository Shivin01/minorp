class UserMailer < ApplicationMailer::Base
	default from: 'unplugnoreply@gmail.com'
	def welcome_email(user)
		mail(to: user.email,
			 from: "unplugnoreply@gmail.com",
			 subjects: "Post created",
			 body: "This is my first mailer",
			 )
	end
end
