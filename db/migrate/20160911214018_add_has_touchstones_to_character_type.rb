class AddHasTouchstonesToCharacterType < ActiveRecord::Migration
  def change
    add_column :character_types, :has_touchstone, :boolean
  end
end
