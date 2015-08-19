class RenameAttributesTable < ActiveRecord::Migration
  def change
  	rename_table :attributes, :attribs
  end
end
