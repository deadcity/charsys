module Admin
	class LineagesController < ApplicationController
		def index
			@lineages = Lineage.all.order(:name)
		end

		def show
			@lineage = Lineage.find(params[:id])
		end

		def new
			@lineage = Lineage.new
		end

		def create
			@lineage = Lineage.new(lineages_params)
			if @lineage.save!
				flash[:success] = "Your new lineage was created."
				redirect_to admin_lineages_path
			else
				flash[:error] = "There was an error saving your lineage."
				redirect_to new_admin_lineage_path
			end
		end

		def edit
			@lineage = Lineage.find(params[:id])
		end

		def update
			@lineage = Lineage.find(params[:id])
			if @lineage.update_attributes!(lineages_params)
				flash[:success] = "Your #{@lineage.character_type.lineage} was saved."
				redirect_to admin_lineages_path
			else
				flash[:error] = "There was an error saving your lineage."
				redirect_to edit_admin_lineage_path(params[:id])
			end
		end

		def destroy
			@lineage = Lineage.find(params[:id])
			flash[:success] = "Your lineage was successfully deleted."
			@lineage.delete
			redirect_to admin_lineages_path
		end

		private

		def lineages_params
			params.require(:lineage).permit(:id, :name, :status, :character_type_id)
		end
	end
end