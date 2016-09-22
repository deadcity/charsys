class RenameCharacterTypeHasLineageToCharacterTypesLineages < ActiveRecord::Migration
  def change
  	rename_table :character_type_has_lineages, :character_types_lineages
  end
end
