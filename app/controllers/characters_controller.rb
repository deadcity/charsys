class CharactersController < ApplicationController

	def show
		@character = Character.find_by(id: params[:id])
	end

	def edit
		@character = Character.find_by(id: params[:id])
	end

	def update

	end

	def delete
		@character = Character.find_by(id: params[:id])
	end
end
