module Admin
	class CharacterTypesController < ApplicationController
		def index
			@character_types = CharacterType.all
		end

		def new
			@character_type = CharacterType.new
		end

		def create
			@character_type = CharacterType.new(character_types_params)
			if @character_type.save!
				flash[:success] = "Your new character type was created."
				redirect_to new_character_types_path
			else
				flash[:error] = "There was an error creating your new character type."
				redirect_to new_character_types_path
			end
		end

		def show
			@character_type = CharacterType.find(params[:id])
		end

		def edit
			@character_type = CharacterType.find(params[:id])
		end

		def destroy
			
		end

		private

		def character_types_params
			params.require(:character_type).permit(:name, :power_stat, :resource, :morality, :behavior_primary, :behavior_secondary)
		end
	end
end