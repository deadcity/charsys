module Admin
	class PowerGroupsController < ApplicationController
		def index
			@power_groups = PowerGroup.all
			puts @power_groups.inspect
		end

		def show
			@power_group = PowerGroup.find(params[:id])
		end

		def new
			@power_group = PowerGroup.new
		end

		def edit
			@power_group = PowerGroup.find(params[:id])
		end

		def create
			@power_group = PowerGroup.new(power_groups_params)
			if @power_group.save!
				flash[:success] = "The power group #{@power_group.name} was successfully created."
				redirect_to admin_power_groups_path
			else
				flash[:error] = "There was an error creating your power group."
				redirect_to new_admin_power_group_path
			end
		end

		def update
			@power_group = PowerGroup.find(params[:id])
			if @power_group.update_attributes!(power_groups_params)
				flash[:success] = "The power group #{@power_group.name} was successfully updated."
				redirect_to admin_power_groups_path
			else
				flash[:error] = "There was an error updating the power group #{@power_group.name}."
				redirect_to edit_admin_power_group_path(@power_group)
			end
		end

		def destroy
			@power_group = PowerGroup.find(params[:id])
			name = @power_group.name
			@power_group.delete
			flash[:success] = "The power group #{name} was successfully deleted."
			redirect_to admin_power_groups_path
		end

		private

		def power_groups_params
			params.require(:power_group).permit(:name, :character_type_id, :power_type_ids)
		end
	end
end