class CreatePowers < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.string :name
      t.integer :rating
      t.integer :power_type_id

      t.timestamps null: false
    end
  end
end
