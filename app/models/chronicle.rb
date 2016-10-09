class Chronicle < ActiveRecord::Base
	validates :title, presence: true
	
	has_many :characters
	has_and_belongs_to_many :users
	has_many :chronicle_allows_character_types
	has_many :character_types, :through => :chronicle_allows_character_types
	has_many :games

	def sts
		self.users
	end

	def to_s
		self.title
	end
end
