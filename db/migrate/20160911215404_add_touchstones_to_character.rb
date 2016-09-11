class AddTouchstonesToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :touchstones, :text, default: ''
  end
end
