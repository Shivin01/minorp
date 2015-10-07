class UserMailer < ApplicationMailer
	default from: "unplugnoreply@gmail.com"
	def welcome_email(user)
			@user = user
			@url = 'https://whispering-wildwood-8183.herokuapp.com/'
			mail(to: @user.email, subject: 'Welcome to Unplug')
  	end
end
