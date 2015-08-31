class AddSubmittedColumnToDowntimeAction < ActiveRecord::Migration
  def change
  	add_column :downtime_actions, :submitted, :boolean, default: false
  end
end
