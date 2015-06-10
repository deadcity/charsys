class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :name
      t.integer :attribute_category_id

      t.timestamps null: false
    end
  end
end
