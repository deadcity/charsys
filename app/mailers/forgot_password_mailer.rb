class ForgotPasswordMailer < ActionMailer::Base
	def reset_password(user, newpass)
		@user = user
		@newpass = newpass
		mail(
			to: @user.email,
			from: 'storytellers@deadcityproductions.com',
			subject: "[DCP Character System] Your password has been reset"
		)
	end
end