class CreateAttributeCategories < ActiveRecord::Migration
  def change
    create_table :attribute_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
