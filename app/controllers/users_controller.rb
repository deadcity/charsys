class UsersController < ApplicationController
	def create
		@user = User.new(username: params[:user][:username], name: params[:user][:name], email: params[:user][:email], password: params[:password])
		@user.save!
		session[:user_id] = @user.id
		redirect_to :root
	end

	def edit

	end
end
