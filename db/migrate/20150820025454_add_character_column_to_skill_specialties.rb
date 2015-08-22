class AddCharacterColumnToSkillSpecialties < ActiveRecord::Migration
  def change
  	add_column :skill_specialties, :character_id, :integer
  end
end
