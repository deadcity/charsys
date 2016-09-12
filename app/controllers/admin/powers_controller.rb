module Admin
	class PowersController < ApplicationController
		def index
			@powers = PowerType.all
		end

		def show
			@power = Power.find(params[:id])
		end

		def new
			@power = Power.new
		end

		def create
			@power = Power.new(powers_params)
			if @power.save!
				flash[:success] = "#{@power.name} successfully created."
				redirect_to admin_powers_path
			else
				flash[:error] = "There was an error creating your power."
				redirect_to new_admin_power_path
		end

		def edit
			@power = Power.find(params[:id])
		end

		def update
			@power = Power.find(params[:id])
			if @power.update_attributes!(powers_params)
				flash[:success] = "#{@power.name} successfully updated."
				redirect_to admin_powers_path
			else
				flash[:error] = "There was an error updating #{@power.name}."
				redirect_to edit_admin_power_path(@power)
			end
		end

		def destroy
			@power = Power.find(params[:id])
			@power.delete
		end

		private

		def powers_params
			params.require(:power).permit(:name, :power_group_id)
		end
	end
end