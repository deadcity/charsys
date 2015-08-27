class DowntimeAction < ActiveRecord::Base
	validates :character_id, :game_id, :title, :points_spent, :assets, :description, presence: true

	belongs_to :character
	belongs_to :game
end