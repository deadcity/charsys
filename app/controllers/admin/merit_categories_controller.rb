module Admin
	class MeritCategoriesController < ApplicationController
		def index
			@merit_categories = MeritCategory.all
		end

		def show
			@merit_category = MeritCategory.find(params[:id])
		end

		def new
			@merit_category = MeritCategory.new
		end

		def edit
			@merit_category = MeritCategory.find(params[:id])
		end

		def create
			@merit_category = MeritCategory.new(merit_category_params)
			if @merit_category.save!
				flash[:success] = "Your merit category, #{@merit_category.name}, was created."
				redirect_to admin_merit_categories_path
			else
				flash[:error] = "There was an error creating your merit category."
				redirect_to new_admin_merit_category_path
			end
		end

		def update
			@merit_category = MeritCategory.find(params[:id])
			if @merit_category.update_attributes!(merit_categories_params)
				flash[:success] = "Your merit category was successfully updated."
				redirect_to admin_merit_categories_path
			else
				flash[:error] = "There was an error updating your merit category."
				redirect_to edit_admin_merit_category_path(params[:id])
			end
		end

		def destroy
			@merit_category = MeritCategory.find(params[:id])
			@merit_category.delete
		end

		private

		def merit_categories_params
			params.require(:merit_category).permit(:id, :merit_category, :status)
		end
	end
end