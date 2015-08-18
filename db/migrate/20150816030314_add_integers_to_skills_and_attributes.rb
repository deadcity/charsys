class AddIntegersToSkillsAndAttributes < ActiveRecord::Migration
  def change
  	add_column :character_has_attributes, :value, :integer, default: 1
  	add_column :character_has_skills, :value, :integer, default: 0
  end
end
