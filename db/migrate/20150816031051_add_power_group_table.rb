class AddPowerGroupTable < ActiveRecord::Migration
  def change
  	create_table :power_groups do |t|
  	  t.string :name
  	  t.integer :power_type_id
  	end
  end
end
