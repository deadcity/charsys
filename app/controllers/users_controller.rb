class UsersController < ApplicationController
	def create
		user = params[:user]
		@user = User.new({username: user[:username], name: user[:name], email: user[:email], password: params[:password]})
		@user.save!
		session[:user_id] = @user.id
		redirect_to :root
	end

	def edit

	end

	private

	def user_params
		params.require(:user).permit(:username, :name, :email, :password_digest)
	end
end
