class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def is_logged_in?
		if User.find_by_id(session[:user_id])
			return true
		end
		return false
  end
  
  def authenticate_user!
      unless is_logged_in? 
          redirect_to login_path
      end
  end

	def is_admin?

	end

	def is_storyteller?

	end

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
