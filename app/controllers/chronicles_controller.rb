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
			flash[:error] = "You do not have permission to edit this chronicle."
			redirect_to chronicles_path
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

	def downtime_actions
		@chronicle = Chronicle.find_by_id(params[:id])
		@game = Game.find_by_id(params[:game_id])
		@downtime_actions = @game.downtime_actions
	end

	def show_downtime_action
		@chronicle = Chronicle.find_by_id(params[:id])
		@downtime_action = DowntimeAction.find_by_id(params[:downtime_action_id])
	end

	def process_downtime_action
		@chronicle = Chronicle.find_by_id(params[:id])
		@game = Game.find_by_id(params[:game_id])
		@downtime_action = DowntimeAction.find_by_id(params[:downtime_action_id])
		if @downtime_action.update_attributes(response: params[:downtime_action][:response])
			flash[:success] = "Downtime response saved."
		else
			@error = @character.errors.messages
			flash[:error] = @error
		end
		redirect_to show_downtime_action_path(@chronicle, @game, @downtime_action)
	end

	def print_downtime_actions
		@chronicle = Chronicle.find_by_id(params[:id])
		@game = Game.find_by_id(params[:game_id])
		@characters = @chronicle.characters
	end

	def games
		@chronicle = Chronicle.find_by_id(params[:id])
		@games = Game.where(chronicle: params[:id])
	end

	def new_game
		@chronicle = Chronicle.find_by_id(params[:id])
		@game = Game.new
	end

	def create_game
		@chronicle = Chronicle.find_by_id(params[:id])
		@game = Game.new(games_params)
		if @game.save
			flash[:success] = "Your game was added to #{@chronicle.title}."
			redirect_to games_path(@chronicle)
		else
			@error = @character.errors.messages
			flash[:error] = @error
			redirect_to new_game_path(@chronicle)
		end
	end

	def edit_game
		@chronicle = Chronicle.find_by_id(params[:id])
		@game = Game.find_by_id(params[:game_id])
	end

	def update_game
		@chronicle = Chronicle.find_by_id(params[:id])
		@game = Game.find_by_id(params[:game_id])
		if @game.update_attributes(games_params)
			flash[:success] = "Your game was updated."
			redirect_to games_path(@chronicle)
		else
			@error = @character.errors.messages
			flash[:error] = @error
			redirect_to edit_game_path(@chronicle, @game)
		end
	end

	def destroy_game
		@game = Game.find_by_id(params[:game_id])
		@chronicle = Chronicle.find_by_id(params[:id])
		@game.delete
		redirect_to games_path(@chronicle)
	end

	private

	def chronicles_params
		params.require(:chronicle).permit(:title, chronicle_has_character_types_attributes: [:character_type_id, :chronicle_id, :id], user_administers_chronicles_attributes: [:user_id, :chronicle_id, :id])
	end

	def games_params
		params.require(:game).permit(:title, :game_number, :chronicle_id, :active)
	end
end
