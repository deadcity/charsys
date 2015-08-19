class AddPowerGroupIdToPower < ActiveRecord::Migration
  def change
  	rename_column :powers, :power_type_id, :power_group_id
  end
end
