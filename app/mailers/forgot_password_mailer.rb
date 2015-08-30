class ForgotPasswordMailer < ActionMailer::Base
  def message(user, newpass)
  	@newpass = newpass
  	@user = user
    mail(
      :subject => '[DCP Character System] Reset Your Password',
      :to  => user.email,
      :from => 'storytellers@deadcityproductions.com')
  end
end