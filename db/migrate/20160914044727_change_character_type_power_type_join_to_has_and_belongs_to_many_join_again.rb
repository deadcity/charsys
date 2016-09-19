class ChangeCharacterTypePowerTypeJoinToHasAndBelongsToManyJoinAgain < ActiveRecord::Migration
  def change
  	rename_table :character_type_power_type, :character_types_power_types
  end
end
