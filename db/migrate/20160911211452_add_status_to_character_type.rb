class AddStatusToCharacterType < ActiveRecord::Migration
  def change
    add_column :character_types, :status, :boolean, default: true
  end
end
