class SessionController < ApplicationController
	def login
	end

	def new
		@user = User.find_by_username(params[:username])
		if @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:success] = "You have been successfully logged in."
		else
			flash[:error] = "There was an error logging you in. Please try again."
		end
			redirect_to :root
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have been logged out."
		redirect_to :root
	end

	def forgot_password
		@user = User.find_by_email(params[:email])
		random_password = Array.new(10).map { (65 + rand(58)).chr }.join
		@user.password = random_password
		@user.save!
		Pony.mail(
		:to => @user.email,
		:from => 'storytellers@deadcityproductions.com',
		:subject => '[DCP] Your character system password has been reset',
		:body => "Your new password is #{random_password}.  Please remember to change it to something more memorable after logging in.",
		:html_body => "Your new password is <strong>#{random_password}</strong>.  Please remember to change it to something more memorable after logging in.",
		:via => 'smtp',
		:via_options => {
			:address => 'smtp.postmarkapp.com',
			:port => 25,
			:user_name => '6f6b3f80-87a2-4986-a61d-79b91dffef96',
			:password => '6f6b3f80-87a2-4986-a61d-79b91dffef96'
			}
		)
	end
end
