class AddQuestionLabelsToCharacterTypes < ActiveRecord::Migration
  def change
  	add_column :character_types, :question1, :string
  	add_column :character_types, :question2, :string
  	add_column :character_types, :question3, :string
  	add_column :character_types, :question4, :string
  	add_column :character_types, :question5, :string
  	add_column :character_types, :question6, :string
  	add_column :character_types, :question7, :string
  	add_column :character_types, :question8, :string
  end
end
