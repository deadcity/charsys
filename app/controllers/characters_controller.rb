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
			@flaws = Flaw.where(character_type: @character_type)
			@character = Character.new
		else
			redirect_to login_path
		end
	end

	def create
		@character = Character.new(characters_params)
		if @character.save
			flash[:success] = "Your character was saved."
			if @character.status == 1
				storytellers = @character.chronicle.sts
				storytellers.each do |storyteller|
					CharacterMailer.character_submission(character, st).deliver_now
				end
			end
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
			renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true, filter_html: true)
			@markdown = Redcarpet::Markdown.new(renderer, extensions = {})
			@chronicle = @character.chronicle
			@mental_skills = Skill.where({skill_category: 1})
			@physical_skills = Skill.where({skill_category: 2})
			@social_skills = Skill.where({skill_category: 3})
			@xp_total = @character.xp_records.sum(:amount)
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
			@flaws = Flaw.where(character_type: @character_type)
			@status_array = Array.new
			CHARACTER_STATUS.each_with_index do |i, status|
				@status_array << [i, status]
			end
			redirect_to index_path if @character.user != current_user && @chronicle.sts.exclude?(current_user)
			redirect_to character_path(@character) if @character.status != 0 && @chronicle.sts.exclude?(current_user)
		end
	end

	def update
		@character = Character.find_by_id(params[:character][:id])
		prevstatus = @character.status
		puts params[:character][:character_has_flaws_attributes]
		if @character.update_attributes!(characters_params)
			if @character.status == 1 && @character.status > prevstatus
				storytellers = @character.chronicle.sts
				storytellers.each do |storyteller|
					CharacterMailer.character_submission(@character, storyteller).deliver_now
				end
			elsif @character.status == (2 or 3) && prevstatus < 2
				CharacterMailer.character_approval(@character).deliver_now
			end
			flash[:success] = "Your changes to your character were saved."
			redirect_to character_path(@character)
		else
			@error = @character.errors.messages
			flash[:error] = @error
			redirect_to edit_character_path(@character)
		end
	end

	def destroy
		@character = Character.find_by_id(params[:id])
		@character.delete
		redirect_to characters_path
	end

	def downtime_actions
		@character = Character.find_by_id(params[:id])
		redirect_to index_path if @character.user != current_user
		@downtime_actions = @character.downtime_actions
	end

	def downtime_action
		@character = Character.find_by_id(params[:id])
		redirect_to index_path if @character.user != current_user
		@downtime_action = DowntimeAction.find_by_id(params[:downtime_action_id])
	end

	def new_downtime_action
		@character = Character.find_by_id(params[:id])
		redirect_to index_path if @character.user != current_user
		@downtime_action = DowntimeAction.new
		@games = Game.where(chronicle: @character.chronicle, active: true)
	end

	def create_downtime_action
		@character = Character.find_by_id(params[:id])
		@downtime_action = DowntimeAction.new(downtime_actions_params)
		if @downtime_action.save
			flash[:success] = "Your downtime action has been saved."
			redirect_to character_downtime_actions_path(@character)
		else
			@error = @character.errors.messages
			flash[:error] = @error
			redirect_to character_new_downtime_action_path
		end
	end

	def edit_downtime_action
		@character = Character.find_by_id(params[:id])
		redirect_to index_path if @character.user != current_user
		@downtime_action = DowntimeAction.find_by_id(params[:downtime_action_id])
		@games = Game.where(chronicle: @character.chronicle, active: true)
	end

	def update_downtime_action
		@character = Character.find_by_id(params[:id])
		@downtime_action = DowntimeAction.find_by_id(params[:downtime_action_id])
		if @downtime_action.update_attributes(downtime_actions_params)
			flash[:success] = "Your downtime action has been saved."
			redirect_to character_downtime_actions_path(@character)
		else
			@error = @character.errors.messages
			flash[:error] = @error
			redirect_to character_edit_downtime_action_path(@character)
		end
	end

	def destroy_downtime_action
		@character = Character.find_by_id(params[:id])
		@downtime_action = DowntimeAction.find_by_id(params[:downtime_action_id])
		if @downtime_action.delete
			flash[:success] = "Your downtime action was deleted."
		else
			@error = @character.errors.messages
			flash[:error] = @error
		end
		redirect_to character_downtime_actions_path(@character)
	end

	private

	def characters_params
		params.require(:character).permit(:name, :sublineage, :max_resource, :behavior_primary_id, :behavior_secondary_id, :lineage_id, :affiliation_id, :user_id, :chronicle_id, :character_type_id, :attribs, :skills, :merits, :health, :willpower, :power_stat, :morality, :size, :speed, :initiative_mod, :armor_ballistic, :armor_general, :defense, :answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :answer8, :printed_notes, :st_notes, :misc, :intelligence, :wits, :resolve, :strength, :dexterity, :stamina, :presence, :manipulation, :composure, :academics, :computer, :crafts, :computer, :investigation, :medicine, :occult, :politics, :science, :athletics, :brawl, :drive, :firearms, :larceny, :stealth, :survival, :weaponry, :animal_ken, :empathy, :expression, :intimidation, :persuasion, :streetwise, :subterfuge, :status, :wishlist, skill_specialties_attributes: [:skill_id, :specialty, :character_id, :id, :_destroy], character_has_powers_attributes: [:character_id, :power_id, :id, :_destroy], character_has_merits_attributes: [:character_id, :merit_id, :specification, :description, :rating, :id, :_destroy], character_has_flaws_attributes: [:character_id, :flaw_id, :specification, :description, :id, :_destroy])
	end

	def downtime_actions_params
		params.require(:downtime_action).permit(:character_id, :game_id, :title, :assets, :points_spent, :description, :submitted)
	end
end
