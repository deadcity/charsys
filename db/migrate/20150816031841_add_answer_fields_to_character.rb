class AddAnswerFieldsToCharacter < ActiveRecord::Migration
  def change
  	add_column :characters, :answer1, :text
  	add_column :characters, :answer2, :text
  	add_column :characters, :answer3, :text
  	add_column :characters, :answer4, :text
  	add_column :characters, :answer5, :text
  	add_column :characters, :answer6, :text
  	add_column :characters, :answer7, :text
  	add_column :characters, :answer8, :text
  end
end
