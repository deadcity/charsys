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
			@merit_categories = MeritCategory.all
			@merits = Merit.all
			@character = Character.new
		else
			redirect_to login_path
		end
	end

	def create
		@character = Character.new(characters_params)
		if @character.save!
			flash[:success] = "Your character was saved."
			redirect_to character_path(@character)
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
		@user = User.find_by_id(session[:user_id])
		@chronicle = @character.chronicle
		@user = User.find_by_id(session[:user_id])
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
		redirect_to index_path if @character.user != current_user
	end

	def update
		@character = Character.find_by_id(params[:character][:id])
		if params[:character][:skill_specialties].present?
			specialties = []
			params[:character][:skill_specialties].each do |specialty|
				specialties << SkillSpecialty.new({skill_id: specialty[:skill_id], specialty: specialty[:specialty], character_id: @character.id})
			end
		end
		params[:character][:skill_specialties] = specialties
		puts params[:character]
		if @character.update_attributes!(characters_params)
			flash[:success] = "Your changes to your character were saved."
			if specialties.present?
				specialties.each do |specialty|
					specialty.save!
				end
			end
			redirect_to character_path(@character)
		else
			flash[:alert] = "There was an error saving changes to your character."
			redirect_to edit_character_path(@character)
		end
	end

	def delete
		@character = Character.find_by_id(params[:id])
	end

	private

	def characters_params
		params.require(:character).permit(:name, :behavior_primary, :behavior_secondary, :lineage_id, :affiliation_id, :user_id, :chronicle_id, :character_type_id, :attribs, :skills, :merits, :health, :willpower, :powers, :power_stat, :morality, :size, :speed, :armor_ballistic, :armor_general, :defense, :answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :answer8, :printed_notes, :st_notes, :misc, skill_specialties: [:skill_id, :specialty, :character_id])
	end
end
