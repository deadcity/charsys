class ForgotPasswordMailer < ActionMailer::Base
  def message(user, newpass)
    mail(
      :subject => 'DCP Charsys: Reset Your Password',
      :to  => user.email,
      :from => 'storytellers@deadcityproductions.com',
      :html_body => 'Your new password is #{newpass}.  Please remember to change it to something more memorable after logging in.',
      :track_opens => 'true')
  end
end