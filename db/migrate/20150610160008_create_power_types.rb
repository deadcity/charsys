class CreatePowerTypes < ActiveRecord::Migration
  def change
    create_table :power_types do |t|
      t.string :name
      t.integer :character_type_id

      t.timestamps null: false
    end
  end
end
