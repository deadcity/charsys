class UsersController < ApplicationController
	def create
		user = params[:user]
		@user = User.new({username: user[:username], name: user[:name], email: user[:email], password: params[:password]})
		if @user.valid?
			@user.save!
			flash[:success] = "Thanks for registering! You're now logged in."
			session[:user_id] = @user.id
		else
			flash[:alert] = "There was an error creating your account."
		end
		redirect_to register_path
	end

	def edit

	end

	private

	def user_params
		params.require(:user).permit(:username, :name, :email, :password_digest)
	end
end
