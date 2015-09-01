class ChangeNameOfFlawNameField < ActiveRecord::Migration
  def change
  	rename_column :character_types, :flaws, :flaw_name
  end
end
