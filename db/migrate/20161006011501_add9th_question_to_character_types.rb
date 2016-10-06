class Add9thQuestionToCharacterTypes < ActiveRecord::Migration
  def change
    add_column :character_types, :question9, :string
  end
end
