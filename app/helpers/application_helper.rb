module ApplicationHelper
	def is_logged_in?
		if @user.find(session[:user_id])
			return true
		end
		return false
	end

	def can_view_character?

	end

	def is_admin?

	end
end
