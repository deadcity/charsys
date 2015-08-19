class CharactersController < ApplicationController
	def index
		if current_user
			@characters = current_user.characters.all
		else
			redirect_to login_path
		end
	end

	def new
		if current_user
			@user = User.find_by_id(session[:user_id])
			@chronicle = Chronicle.find_by_id(session[:current_chronicle].id)
			@character = Character.new
		else
			redirect_to login_path
		end
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
		redirect_to index_path if @character.user != current_user
	end

	def edit
		@character = Character.find_by_id(params[:id])
		redirect_to index_path if @character.user != current_user
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
