class AddBanesForVampires < ActiveRecord::Migration
  def change
  	add_column :character_types, :flaws, :string
  	create_table :flaws do |t|
  		t.integer :character_type_id
  		t.string :name
  		t.text :description
  		t.boolean :requires_specification
  		t.boolean :requires_description
  	end
  	create_table :character_has_flaws do |t|
  		t.integer :flaw_id
  		t.integer :character_id
  		t.string :specification
  		t.text :description
  	end
  end
end
