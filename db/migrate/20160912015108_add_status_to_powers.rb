class AddStatusToPowers < ActiveRecord::Migration
  def change
    add_column :powers, :status, :boolean, default: true
  end
end
