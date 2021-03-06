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
				redirect_to admin_character_types_path
			else
				flash[:error] = "There was an error creating your new character type."
				redirect_to new_admin_character_types_path
			end
		end

		def show
			@character_type = CharacterType.find_by_id(params[:id])
		end

		def edit
			@character_type = CharacterType.find_by_id(params[:id])
		end

		def update
			@character_type = CharacterType.find_by_id(params[:id])
			if @character_type.update_attributes!(character_types_params)
				flash[:success] = "The #{@character_type.name} character type has been updated."
				redirect_to admin_character_types_path
			else
				flash[:alert] = "There was an error editing the #{@character_type.name} character type."
				redirect_to admin_edit_character_types_path
			end
		end

		def destroy
			@character_type = CharacterType.find_by_id(params[:id])
			flash[:success] = "The #{@character_type.name} character type has been deleted."
			@character_type.delete
			redirect_to admin_character_types_path
		end

		private

		def character_types_params
			params.require(:character_type).permit(:name, :power_stat, :status, :resource, :morality, :lineage, :sublineage, :affiliation, :behavior_primary, :behavior_secondary, :flaw_name, :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9)
		end
	end
end
