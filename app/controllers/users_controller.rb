class UsersController < ApplicationController
	def create
		@user = User.new(username: params[:user][:username], name: params[:user][:name], email: params[:user][:email], password: params[:password])
		@user.save!
		give_token
		redirect_to home_url
	end

	def edit

	end
end
