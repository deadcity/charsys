module Admin
	class PowerTypesController < ApplicationController
		def index
			@power_types = PowerType.all
		end

		def show
			@power_type = PowerType.find(params[:id])
		end

		def new
			@power_type = PowerType.new
			@character_types = CharacterType.all
		end

		def create
			@power_type = PowerType.new(power_types_params)
			@power_type.character_type_ids = params[:power_type][:character_type_ids]
			if @power_type.save!
				flash[:success] = "Your power type was successfully created."
				redirect_to admin_power_types_path
			else
				flash[:error] = "There was an error saving your new power type."
				redirect_to new_admin_power_type_path
			end
		end

		def edit
			@power_type = PowerType.find(params[:id])
			@character_types = CharacterType.all
		end

		def update
			@power_type = PowerType.find(params[:id])
			@power_type.character_type_ids = params[:power_type][:character_type_ids]
			if @power_type.update_attributes!(power_types_params)
				flash[:success] = "The #{@power_type.name} power type was successfully updated."
				redirect_to admin_power_types_path
			else
				flash[:error] = "There was an error saving the #{@power_type.name} power type."
				redirect_to edit_admin_power_type_path(@power_type)
			end
		end

		def destroy
			@power_type = PowerType.find(params[:id])
			flash[:success] = "The #{@power_type.name} power type was successfully deleted."
			@power_type.delete
			redirect_to admin_power_types_path
		end

		private

		def power_types_params
			params.require(:power_type).permit(:name, :status, :character_type_ids)
		end
	end
end