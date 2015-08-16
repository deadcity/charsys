class ChroniclesController < ApplicationController
	def new
		@chronicle = Chronicle.new
	end

	def create
		@chronicle = Chronicle.new(title: params[:chronicle][:title])
		if @chronicle.save!
			flash[:success] = "New chronicle #{@chronicle.title} successfully created."
			session[:current_chronicle] = @chronicle.id
			redirect_to :root
		else
			flash[:error] = "There was an error creating your chronicle."
			redirect_to new_chronicle_path
		end
	end

	def edit
		@chronicle = Chronicle.find_by_id(params[:id])
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
