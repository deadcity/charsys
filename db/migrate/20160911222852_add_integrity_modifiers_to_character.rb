class AddIntegrityModifiersToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :integrity_modifiers, :text, default: ''
  end
end
