class Game < ActiveRecord::Base
	validates :title, :chronicle_id, presence: true
	belongs_to :chronicle
	has_many :downtime_actions
end