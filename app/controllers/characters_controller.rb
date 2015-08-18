class CharactersController < ApplicationController
	def index
		@characters = Character.find_by_user_id(current_user.id)
		@chronicles = Chronicle.all
	end

	def new
		@user = User.find_by_id(session[:user_id])
		@chronicle = Chronicle.first
		@character_type = CharacterType.first
		@character = Character.new
	end

	def create
		@character = Character.new(params[:character])
		if @character.save!
			flash[:success] = "Your character was saved."
			redirect_to show_character_path(@character)
		else
			flash[:error] = "There was an error saving your character"
			redirect_to new_character_path
		end
	end

	def show
		@character = Character.find_by_id(params[:id])
	end

	def edit
		@character = Character.find_by_id(params[:id])
	end

	def update
		@character = Character.find_by_id(params[:id])
		if @character.update!(params[:character])
			flash[:success] = "Your changes to your character were saved."
			redirect_to show_character_path(@character)
		else

		end
	end

	def delete
		@character = Character.find_by_id(params[:id])
	end
end
