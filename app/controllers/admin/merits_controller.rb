module Admin
	class MeritsController < ApplicationController
		def index
			@merits = Merit.all
		end

		def show
			@merit = Merit.find_by_id(params[:id])
		end

		def edit
			@merit = Merit.find_by_id(params[:id])
		end

		def update
			@merit = Merit.find_by_id(params[:id])
			if @merit.update_attributes!(merits_params)
				flash[:success] = "The #{@merit.name} merit was successfully updated."
				redirect_to admin_merits_path
			else
				flash[:alert] = "There was an error updating the #{@merit.name} merit."
				redirect_to edit_admin_merit_path(params[:id])
			end
		end

		def new
			@merit = Merit.new
		end

		def create
			@merit = Merit.new(merits_params)
			if @merit.save!
				flash[:success] = "The #{@merit.name} merit was successfully created."
				redirect_to admin_merits_path
			else
				flash[:alert] = "There was an error creating your merit."
				redirect_to new_admin_merit_path
			end
		end

		private

		def merits_params
			params.require(:merit).permit(:name, :allowed_ratings, :has_specification, :has_description, :merit_category_id)
		end
	end
end