class FixNameOfMeritsJoinTable < ActiveRecord::Migration
  def change
  	rename_table :character_has_merit, :character_has_merits
  end
end
