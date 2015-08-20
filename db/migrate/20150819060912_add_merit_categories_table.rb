class AddMeritCategoriesTable < ActiveRecord::Migration
  def change
  	create_table :merit_categories do |t|
  		t.string :merit_category
  	end
  	add_column :merits, :merit_category_id, :integer
  end
end
