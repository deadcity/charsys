class ChroniclesController < ApplicationController
	def new
		@chronicle = Chronicle.new
	end

	def create
		@chronicle = Chronicle.new(title: params[:chronicle][:title])
		if @chronicle.save!
			flash[:success] = "New chronicle %{@chronicle.title} successfully created."
			session[:current_chronicle] = @chronicle.id
			redirect_to :root
		else
			flash[:error] = "There was an error creating your chronicle."
			redirect_to new_chronicle_path
		end
	end
end
