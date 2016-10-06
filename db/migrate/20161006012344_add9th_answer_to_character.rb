class Add9thAnswerToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :answer9, :text
  end
end
