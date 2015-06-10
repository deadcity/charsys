class CreateUserAdministersChronicles < ActiveRecord::Migration
  def change
    create_table :user_administers_chronicles do |t|
      t.integer :user_id
      t.integer :chronicle_id

      t.timestamps null: false
    end
  end
end
