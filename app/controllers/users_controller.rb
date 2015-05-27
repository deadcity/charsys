class UsersController < ApplicationController
	def create
		@user = User.new(params[:user])
		@user.password = params[:password]
		@user.save!
	end

	def edit

	end
end
