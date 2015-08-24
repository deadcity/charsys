class ChroniclesController < ApplicationController
	CHARACTER_STATUS = ['In Progress', 'Submitted', 'Approved', 'Active', 'Deceased', 'Inactive']
	def get_status(status)
		return CHARACTER_STATUS[status]
	end
	helper_method :get_status

	def index
		if current_user
			@chronicles = current_user.chronicles.all
		else
			redirect_to login_path
		end
	end

	def new
		if current_user
			@chronicle = Chronicle.new
		else
			redirect_to login_path
		end
	end

	def create
		@chronicle = current_user.chronicles.create(title: params[:chronicle][:title])
		if @chronicle.save
			flash[:success] = "New chronicle #{@chronicle.title} successfully created."
			session[:current_chronicle] = @chronicle.id
			redirect_to chronicles_path
		else
			flash[:error] = "There was an error creating your chronicle."
			redirect_to new_chronicle_path
		end
	end

	def show
		@chronicle = Chronicle.find_by_id(params[:id])
		redirect_to chronicles_path if @chronicle.sts.exclude?(current_user)
		if @chronicle.nil?
			raise ActionController::RoutingError.new('Not Found')
		else
			@characters = @chronicle.characters.all
		end
	end

	def edit
		@chronicle = Chronicle.find_by_id(params[:id])
		if @chronicle.nil?
			raise ActionController::RoutingError.new('Not Found')
		else
			@characters = @chronicle.characters.all
		end
		if !(@chronicle.users.include? current_user)
			redirect_to chronicles_path
			flash[:error] = "You do not have permission to edit this chronicle."
		end
	end

	def update
		@chronicle = Chronicle.find_by_id(params[:id])
		if @chronicle.update!(chronicles_params)
			flash[:success] = "The chronicle has been updated."
			redirect_to edit_chronicle_path
		else
			flash[:error] = "There was an error saving your chronicle."
			redirect_to edit_chronicle_path
		end
	end

	def destroy
		@chronicle = Chronicle.find_by_id(params[:id])
		@chronicle.delete
		redirect_to chronicles_path
	end

	def print_all
		@chronicle = Chronicle.find_by_id(params[:id])
		@characters = @chronicle.characters
		puts @characters.inspect
		@mental_skills = Skill.where(skill_category: 1)
		@physical_skills = Skill.where(skill_category: 2)
		@social_skills = Skill.where(skill_category: 3)
		respond_to do |format|
			format.html do
				render layout: 'print'
			end
			format.pdf do
				render pdf: "#{@chronicle.title.parameterize}"
			end
		end
	end

	private

	def chronicles_params
		params.require(:chronicle).permit(:title, chronicle_has_character_types_attributes: [:character_type_id, :chronicle_id, :id], user_administers_chronicles_attributes: [:user_id, :chronicle_id, :id])
	end
end
