class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
    	t.string :name
    	t.integer :skill_category_id

      t.timestamps null: false
    end
  end
end
