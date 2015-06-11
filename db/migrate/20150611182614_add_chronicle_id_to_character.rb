class AddChronicleIdToCharacter < ActiveRecord::Migration
  def change
  	add_column :characters, :chronicle_id, :integer
  end
end
