class SetDefaultMorality < ActiveRecord::Migration
  def change
  	change_column :characters, :morality, :integer, default: 7
  end
end
