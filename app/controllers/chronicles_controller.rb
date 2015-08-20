class ChroniclesController < ApplicationController
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
		if @chronicle.save!
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
		@characters = @chronicle.characters.all
	end

	def edit
		@chronicle = Chronicle.find_by_id(params[:id])
		redirect_to index_path if @chronicle.user != current_user
	end

	def update
		@chronicle = Chronicle.find_by_id(params[:id])
		params[:chronicle][:character_types].delete("")
		if @chronicle.update!(params[:chronicle])
			flash[:success] = "The chronicle has been updated."
			redirect_to edit_chronicle_path
		else
			flash[:error] = "There was an error saving your chronicle."
			redirect_to edit_chronicle_path
		end
	end

	private

	def chronicles_params
		params.require(:chronicle).permit(:title, :character_types)
	end
end
