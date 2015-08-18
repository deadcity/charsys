class AddMeritsTable < ActiveRecord::Migration
  def change
  	create_table :merits do |t|
  	  t.string :name
  	  t.boolean :has_specification
  	  t.boolean :has_description
  	  t.string :allowed_ratings
  	end

  	create_table :character_has_merit do |t|
  	  t.integer :character_id
  	  t.integer :merit_id
  	  t.string :specification
  	  t.text :description
  	  t.integer :rating
  	end
  end
end
