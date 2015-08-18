class AddPrintedNotesField < ActiveRecord::Migration
  def change
  	add_column :characters, :printed_notes, :text
  end
end
