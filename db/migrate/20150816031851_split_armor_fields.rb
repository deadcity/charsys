class SplitArmorFields < ActiveRecord::Migration
  def change
  	rename_column :characters, :armor, :armor_ballistic
  	add_column :characters, :armor_general, :integer
  end
end
