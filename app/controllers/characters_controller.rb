require 'json'

class CharactersController < ApplicationController
	CHARACTER_STATUS = ['In Progress', 'Submitted', 'Approved', 'Active', 'Deceased', 'Inactive']
	def get_status(status)
		return CHARACTER_STATUS[status]
	end
	helper_method :get_status


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
			@chronicle = Chronicle.last
			@character = Character.new
			@user = User.find_by_id(session[:user_id])
			@chronicles = Chronicle.all
			@character_type = CharacterType.first
			@character_types = CharacterType.all
			@mental_skills = Skill.where({skill_category: 1})
			@physical_skills = Skill.where({skill_category: 2})
			@social_skills = Skill.where({skill_category: 3})
			@skill_categories = SkillCategory.all
			@merit_categories = MeritCategory.all
			@merits = Merit.all
			@character = Character.new
		else
			redirect_to login_path
		end
	end

	def create
		@character = Character.new(characters_params)
		if @character.save
			flash[:success] = "Your character was saved."
			redirect_to character_path(@character)
		else
			@error = @character.errors.messages
			flash[:error] = @error
			redirect_to new_character_path
		end
	end

	def show
		@character = Character.find_by_id(params[:id])
		if @character.nil?
			raise ActionController::RoutingError.new('Not Found')
		else
			@chronicle = @character.chronicle
			@mental_skills = Skill.where({skill_category: 1})
			@physical_skills = Skill.where({skill_category: 2})
			@social_skills = Skill.where({skill_category: 3})
			redirect_to index_path if @character.user != current_user && @chronicle.sts.exclude?(current_user)
		end
	end

	def edit
		@character = Character.find_by_id(params[:id])
		if @character.nil?
			raise ActionController::RoutingError.new('Not Found')
		else
			@user = User.find_by_id(session[:user_id])
			@chronicle = @character.chronicle
			@chronicles = Chronicle.all
			@character_type = @character.character_type
			@character_types = CharacterType.all
			@mental_skills = Skill.where({skill_category: 1})
			@physical_skills = Skill.where({skill_category: 2})
			@social_skills = Skill.where({skill_category: 3})
			@skill_categories = SkillCategory.all
			@mental_attributes = Attrib.where({attribute_category: 1})
			@merit_categories = MeritCategory.all
			@merits = Merit.all
			redirect_to index_path if @character.user != current_user && @chronicle.sts.exclude?(current_user)
			redirect_to character_path(@character) if @character.status != 0 && current_user == @user
		end
	end

	def update
		@character = Character.find_by_id(params[:character][:id])
		if @character.update_attributes!(characters_params)
			flash[:success] = "Your changes to your character were saved."
			redirect_to character_path(@character)
		else
			flash[:alert] = "There was an error saving changes to your character."
			redirect_to edit_character_path(@character)
		end
	end

	def destroy
		@character = Character.find_by_id(params[:id])
		@character.delete
		redirect_to characters_path
	end

	private

	def characters_params
		params.require(:character).permit(:name, :sublineage, :behavior_primary_id, :behavior_secondary_id, :lineage_id, :affiliation_id, :user_id, :chronicle_id, :character_type_id, :attribs, :skills, :merits, :health, :willpower, :power_stat, :morality, :size, :speed, :armor_ballistic, :armor_general, :defense, :answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :answer8, :printed_notes, :st_notes, :misc, :intelligence, :wits, :resolve, :strength, :dexterity, :stamina, :presence, :manipulation, :composure, :academics, :computer, :crafts, :computer, :investigation, :medicine, :occult, :politics, :science, :athletics, :brawl, :drive, :firearms, :larceny, :stealth, :survival, :weaponry, :animal_ken, :empathy, :expression, :intimidation, :persuasion, :streetwise, :subterfuge, :status, skill_specialties_attributes: [:skill_id, :specialty, :character_id, :id, :_destroy], character_has_powers_attributes: [:character_id, :power_id, :id, :_destroy], character_has_merits_attributes: [:character_id, :merit_id, :specification, :description, :rating, :id])
	end
end
