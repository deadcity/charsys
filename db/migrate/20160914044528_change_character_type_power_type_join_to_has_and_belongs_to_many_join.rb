class ChangeCharacterTypePowerTypeJoinToHasAndBelongsToManyJoin < ActiveRecord::Migration
  def change
  	rename_table :character_type_has_power_types, :character_type_power_type
  end
end
