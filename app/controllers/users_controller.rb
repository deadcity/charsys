class UsersController < ApplicationController
	def create
		@user = User.new(params[:user])
		@user.save!
		session[:user_id] = @user.id
		redirect_to :root
	end

	def edit

	end

	private

	def user_params
		params.require(:user).permit(:username, :name, :email, :password)
	end
end
