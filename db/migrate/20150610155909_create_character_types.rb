class CreateCharacterTypes < ActiveRecord::Migration
  def change
    create_table :character_types do |t|
      t.string :name
      t.string :power_stat
      t.string :resource
      t.string :morality

      t.timestamps null: false
    end
  end
end
