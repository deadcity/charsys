class SetStatusesToTrueByDefault < ActiveRecord::Migration
  def change
  	add_column :chronicles, :status, :boolean, default: true
  	change_column :merits, :status, :boolean, default: true
  	change_column :power_types, :status, :boolean, default: true
  end
end
