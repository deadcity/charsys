class CharacterMailer < ActionMailer::Base
	def character_submission(character, st)
		@character = character
		@user = @character.user.name
		@st_name = st.name
		mail(
      :subject => "[DCP Character System] New character submission from #{@user}",
      :to  => st.email,
      :from => 'storytellers@deadcityproductions.com')
	end

	def character_approval(character)
		@character = character
		@user = @character.user

		mail(
			:subject => "[DCP Character System] Your character submission has been approved",
			:to => @user.email,
			:from => 'storytellers@deadcityproductions.com')
	end
end