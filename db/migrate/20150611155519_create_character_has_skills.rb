class CreateCharacterHasSkills < ActiveRecord::Migration
  def change
    create_table :character_has_skills do |t|
      t.integer :skill_id
      t.integer :character_id

      t.timestamps null: false
    end
  end
end
