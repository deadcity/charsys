class ChroniclesController < ApplicationController
	CHARACTER_STATUS = ['In Progress', 'Submitted', 'Approved', 'Active', 'Deceased', 'Inactive']
	def get_status(status)
		return CHARACTER_STATUS[status]
	end
	helper_method :get_status

	def index
		if current_user
			@chronicles = current_user.chronicles.all
		else
			redirect_to login_path
		end
	end

	def new
		if current_user
			@chronicle = Chronicle.new
		else
			redirect_to login_path
		end
	end

	def create
		@chronicle = current_user.chronicles.create(title: params[:chronicle][:title])
		if @chronicle.save
			flash[:success] = "New chronicle #{@chronicle.title} successfully created."
			session[:current_chronicle] = @chronicle.id
			redirect_to chronicles_path
		else
			flash[:error] = "There was an error creating your chronicle."
			redirect_to new_chronicle_path
		end
	end

	def show
		@chronicle = Chronicle.find_by_id(params[:id])
		redirect_to chronicles_path if @chronicle.sts.exclude?(current_user)
		if @chronicle.nil?
			raise ActionController::RoutingError.new('Not Found')
		else
			@characters = @chronicle.characters.all
		end
	end

	def edit
		@chronicle = Chronicle.find_by_id(params[:id])
		if @chronicle.nil?
			raise ActionController::RoutingError.new('Not Found')
		else
			@characters = @chronicle.characters.all
		end
		if !(@chronicle.users.include? current_user)
			redirect_to chronicles_path
			flash[:error] = "You do not have permission to edit this chronicle."
		end
	end

	def update
		@chronicle = Chronicle.find_by_id(params[:id])
		if @chronicle.update!(chronicles_params)
			flash[:success] = "The chronicle has been updated."
			redirect_to edit_chronicle_path
		else
			flash[:error] = "There was an error saving your chronicle."
			redirect_to edit_chronicle_path
		end
	end

	def destroy
		@chronicle = Chronicle.find_by_id(params[:id])
		@chronicle.delete
		redirect_to chronicles_path
	end

	def xp_records
		@chronicle = Chronicle.find_by_id(params[:id])
		if @chronicle.sts.include?(current_user)
			@characters = @chronicle.characters.collect {|c| c.id }
			if @characters.present?
				@xp_records = XpRecord.where(character_id: @characters)
			else
				@xp_records = []
			end
		else
			redirect_to index_path
	end

	def new_xp_record
		@chronicle = Chronicle.find_by_id(params[:id])
		if @chronicle.sts.include?(current_user)
			@characters = Character.find_by_chronicle_id(params[:id])
			@xp_record = XpRecord.new
		else
			redirect_to index_path
		end
	end

	def new_xp_records
		@chronicle = Chronicle.find_by_id(params[:id])
		if @chronicle.sts.include?(current_user)
			@characters = Character.where(chronicle_id: params[:id], status: 3)
		else
			redirect_to index_path
		end
	end

	def create_xp_record
		@xp_record = XpRecord.new(amount: params[:amount], character_id: params[:character_id], note: params[:note])
		if @xp_record.save
			redirect_to xp_records_path(params[:id])
		else
			redirect_to new_xp_record_path(params[:id])
		end
	end

	def create_xp_records
		@error = []
		params[:character_id].each do |character|
			@xp_record = XpRecord.new(amount: params[:amount], character_id: character, note: params[:note])
			if @xp_record.save
			else
				@error << @character.errors.messages
			end
		end

		unless @error.nil?
			flash[:success] = "Experience was successfully added to all records."
			redirect_to xp_records_path(params[:id])
		else
			flash[:error] = @error
			redirect_to new_xp_records_path(params[:id])
		end
	end

	def destroy_xp_record
		@xp_record = XpRecord.find_by_id(params[:xp_record_id])
		@xp_record.delete
		redirect_to xp_records_path(params[:id])
	end

	private

	def chronicles_params
		params.require(:chronicle).permit(:title, chronicle_has_character_types_attributes: [:character_type_id, :chronicle_id, :id], user_administers_chronicles_attributes: [:user_id, :chronicle_id, :id])
	end
end
