class AddResponseColumnToDowntimes < ActiveRecord::Migration
  def change
  	add_column :downtime_actions, :response, :text
  end
end
