class CreateChronicles < ActiveRecord::Migration
  def change
    create_table :chronicles do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
