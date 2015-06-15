class HomeController < ApplicationController
  def index
  	if !is_logged_in?
  		redirect_to login_path
  	end

  	@user = User.find(session[:user_id])
    @chronicles = Chronicle.all

    if @chronicles.present?

    	if session[:current_chronicle].nil?
    		session[:current_chronicle] = Chronicle.last
    	end

      @chronicle = Chronicle.find(session[:current_chronicle])

  		if @user.chronicles.include?(session[:current_chronicle])
  			@characters = Character.where(chronicle_id: session[:current_chronicle])
  		else
  			@characters = Character.where(user_id: @user.id, chronicle_id: session[:current_chronicle])
  		end
    else
      @characters = nil
    end
  end

  def select_chronicle

  end
end
