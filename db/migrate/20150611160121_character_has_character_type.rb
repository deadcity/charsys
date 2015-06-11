class CharacterHasCharacterType < ActiveRecord::Migration
  def change
  	add_column :characters, :character_type_id, :integer
  end
end
