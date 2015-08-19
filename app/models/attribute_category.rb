class AttributeCategory < ActiveRecord::Base
	validates :name, presence: true

	has_many :attribs
end
