class AddStatusToCharacter < ActiveRecord::Migration
  def change
  	add_column :characters, :status, :integer, default: 1
  end
end
