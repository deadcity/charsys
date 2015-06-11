class HomeController < ApplicationController
  def index
  	if !is_logged_in?
  		redirect_to login_path
  	end

  	@user = User.find(session[:user_id])

  	if session[:current_chronicle].nil?
  		session[:current_chronicle] = Chronicle.last
  	end

		if @user.chronicles.include?(session[:current_chronicle])
			@characters = Character.find(chronicle_id: session[:current_chronicle])
		else
			@characters = Character.find(user_id: @user.id, chronicle_id: session[:current_chronicle])
		end
  end
end
