module Admin
	class FlawsController < ApplicationController
		def index
			@flaws = Flaw.all
		end

		def show
			@flaw = Flaw.find_by_id(params[:id])
		end

		def new
			@flaw = Flaw.new
			@character_types = CharacterType.where.not(flaw_name: '')
		end

		def create
			@flaw = Flaw.new(flaws_params)
			if @flaw.save
				flash[:success] = "Your flaw was successfully created."
				redirect_to admin_flaws_path
			else
				@error = @character.errors.messages
				flash[:error] = @error
				redirect_to new_admin_flaws_path
			end
		end

		def edit
			@flaw = Flaw.find_by_id(params[:id])
			@character_types = CharacterType.all
		end

		def update
			@flaw = Flaw.find_by_id(params[:id])
			if @flaw.update_attributes!(flaws_params)
				flash[:success] = "Your flaw was successfully created."
				redirect_to admin_flaws_path
			else
				@error = @character.errors.messages
				flash[:error] = @error
				redirect_to new_admin_flaws_path
			end
		end

		def destroy
			@flaw = Flaw.find_by_id(params[:id])
			@flaw.delete
			flash[:success] = "Your flaw was successfully deleted."
			redirect_to admin_flaws_path
		end

		private

		def flaws_params
			params.require(:flaw).permit(:name, :character_type_id, :description, :requires_specification, :requires_description, :id)
		end
	end
end