class RenameTablePowerTypesPowerGroupsToPowerTypesPowerGroups < ActiveRecord::Migration
  def change
  	rename_table :table_power_types_power_groups, :power_types_power_groups
  end
end
