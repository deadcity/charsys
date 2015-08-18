class FixAttributeRelatedNamesInModels < ActiveRecord::Migration
  def change
  	rename_column :character_has_attributes, :attribute_id, :attrib_id
  end
end
