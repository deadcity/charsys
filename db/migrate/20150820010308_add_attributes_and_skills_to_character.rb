class AddAttributesAndSkillsToCharacter < ActiveRecord::Migration
  def change
  	add_column :characters, :intelligence, :integer, default: 1
  	add_column :characters, :wits, :integer, default: 1
  	add_column :characters, :resolve, :integer, default: 1
  	add_column :characters, :strength, :integer, default: 1
  	add_column :characters, :dexterity, :integer, default: 1
  	add_column :characters, :stamina, :integer, default: 1
  	add_column :characters, :presence, :integer, default: 1
  	add_column :characters, :manipulation, :integer, default: 1
  	add_column :characters, :composure, :integer, default: 1
  	add_column :characters, :academics, :integer, default: 1
  	add_column :characters, :computer, :integer, default: 1
  	add_column :characters, :crafts, :integer, default: 1
  	add_column :characters, :investigation, :integer, default: 1
  	add_column :characters, :medicine, :integer, default: 1
  	add_column :characters, :occult, :integer, default: 1
  	add_column :characters, :politics, :integer, default: 1
  	add_column :characters, :science, :integer, default: 1
  	add_column :characters, :athletics, :integer, default: 1
  	add_column :characters, :brawl, :integer, default: 1
  	add_column :characters, :drive, :integer, default: 1
  	add_column :characters, :firearms, :integer, default: 1
  	add_column :characters, :larceny, :integer, default: 1
  	add_column :characters, :stealth, :integer, default: 1
  	add_column :characters, :survival, :integer, default: 1
  	add_column :characters, :weaponry, :integer, default: 1
  	add_column :characters, :animal_ken, :integer, default: 1
  	add_column :characters, :empathy, :integer, default: 1
  	add_column :characters, :expression, :integer, default: 1
  	add_column :characters, :intimidation, :integer, default: 1
  	add_column :characters, :persuasion, :integer, default: 1
  	add_column :characters, :socialize, :integer, default: 1
  	add_column :characters, :streetwise, :integer, default: 1
  	add_column :characters, :subterfuge, :integer, default: 1
  end
end
