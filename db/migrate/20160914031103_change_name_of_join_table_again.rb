class ChangeNameOfJoinTableAgain < ActiveRecord::Migration
  def change
  	rename_table :power_groups_power_types, :power_groups_types
  end
end
