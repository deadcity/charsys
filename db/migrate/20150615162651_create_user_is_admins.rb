class CreateUserIsAdmins < ActiveRecord::Migration
  def change
    create_table :user_is_admins do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
