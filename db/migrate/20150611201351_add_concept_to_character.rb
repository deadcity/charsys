class AddConceptToCharacter < ActiveRecord::Migration
  def change
  	add_column :characters, :concept, :string
  end
end
