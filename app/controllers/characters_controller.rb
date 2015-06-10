class CharactersController < ApplicationController
	def new

	end
	
	def show
		@character = Character.find(params[:id])
	end

	def edit
		@character = Character.find(params[:id])
	end

	def update
		@character = Character.find(params[:id])
		if @character.update!(params[:character])

		else

		end
	end

	def delete
		@character = Character.find(params[:id])
	end
end
