module Admin
	class PowerTypesController < ApplicationController
		def index
			@power_types = PowerType.all
		end

		def show
			@power_type = PowerType.find(params[:id])
		end

		def new
			@power_type = PowerType.new
			@character_types = CharacterType.all
		end

		def create

		end

		def edit
			@powerType = PowerType.find(params[:id])
			@character_types = CharacterType.all
		end

		def update

		end

		def destroy

		end
	end
end