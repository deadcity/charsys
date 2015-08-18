class AddStNotesField < ActiveRecord::Migration
  def change
  	add_column :characters, :st_notes, :text
  end
end
