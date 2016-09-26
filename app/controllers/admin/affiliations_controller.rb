module Admin
	class AffiliationsController < ApplicationController
		def index
			@affiliations = Affiliation.all.order(:name)
		end

		def show
			@affiliation = Affiliation.find(params[:id])
		end

		def new
			@affiliation = Affiliation.new
		end

		def create
			@affiliation = Affiliation.new(affiliations_params)
			@affiliation.character_type_ids = params[:affiliation][:character_type_ids]
			if @affiliation.save!
				flash[:success] = "Your new affiliation was created."
				redirect_to admin_affiliations_path
			else
				flash[:error] = "There was an error saving your affiliation."
				redirect_to new_admin_affiliation_path
			end
		end

		def edit
			@affiliation = Affiliation.find(params[:id])
		end

		def update
			@affiliation = Affiliation.find(params[:id])
			@affiliation.character_type_ids = params[:affiliation][:character_type_ids]
			if @affiliation.update_attributes!(affiliations_params)
				flash[:success] = "Your affiliation was saved."
				redirect_to admin_affiliations_path
			else
				flash[:error] = "There was an error saving your affiliation."
				redirect_to edit_admin_affiliation_path(params[:id])
			end
		end

		def destroy
			@affiliation = Affiliation.find(params[:id])
			flash[:success] = "Your affiliation was successfully deleted."
			@affiliation.delete
			redirect_to admin_affiliations_path
		end

		private

		def affiliations_params
			params.require(:affiliation).permit(:id, :name, :status, :character_type_ids)
		end
	end
end