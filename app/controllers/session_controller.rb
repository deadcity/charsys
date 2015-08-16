class SessionController < ApplicationController
	def login
	end

	def new
		@user = User.find_by_username(params[:username])
		if @user.present? and @user.authenticate(params[:password])
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
		ForgotPasswordMailer.message(@user, random_password)
	end
end
