class AddStatusToPowerGroups < ActiveRecord::Migration
  def change
    add_column :power_groups, :status, :boolean, default: true
  end
end
