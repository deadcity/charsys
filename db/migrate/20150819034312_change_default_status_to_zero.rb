class ChangeDefaultStatusToZero < ActiveRecord::Migration
  def change
  	change_column :characters, :status, :integer, default: 0
  end
end
