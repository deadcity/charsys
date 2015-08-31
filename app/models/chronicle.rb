class Chronicle < ActiveRecord::Base
	validates :title, presence: true
	
	has_many :characters
	has_many :user_administers_chronicles
	has_many :users, :through => :user_administers_chronicles, as: :storytellers
	has_many :chronicle_allows_character_types
	has_many :character_types, :through => :chronicle_allows_character_types
	has_many :games

	accepts_nested_attributes_for :user_administers_chronicles

	def sts
		self.users
	end
end
