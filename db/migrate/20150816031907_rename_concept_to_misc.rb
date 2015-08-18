class RenameConceptToMisc < ActiveRecord::Migration
  def change
  	rename_column :characters, :concept, :misc
  end
end
