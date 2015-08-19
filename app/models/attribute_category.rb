class AttributeCategory < ActiveRecord::Base
	validates :name, presence: true
end
