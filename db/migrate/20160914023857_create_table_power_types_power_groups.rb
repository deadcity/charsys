class CreateTablePowerTypesPowerGroups < ActiveRecord::Migration
  def change
    create_table :table_power_types_power_groups do |t|
    	t.integer :power_type_id
    	t.integer :power_group_id
    end
  end
end
