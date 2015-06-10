class CreateSkillSpecialties < ActiveRecord::Migration
  def change
    create_table :skill_specialties do |t|
      t.string :specialty
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
