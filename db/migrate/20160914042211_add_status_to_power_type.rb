class AddStatusToPowerType < ActiveRecord::Migration
  def change
    add_column :power_types, :status, :boolean
  end
end
