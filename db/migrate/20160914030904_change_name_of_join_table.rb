class ChangeNameOfJoinTable < ActiveRecord::Migration
  def change
  	rename_table :power_types_power_groups, :power_groups_power_types
  end
end
