class AddDefaultsToPowerStatEtc < ActiveRecord::Migration
  def change
  	change_column :characters, :power_stat, :integer, default: 1
  	change_column :characters, :max_resource, :integer, default: 10
  	change_column :characters, :health, :integer, default: 6
  	change_column :characters, :willpower, :integer, default: 2
  end
end
