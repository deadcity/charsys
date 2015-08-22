class SetSkillsToZeroByDefault < ActiveRecord::Migration
  def change
  	change_column :characters, :academics, :integer, default: 0
  	change_column :characters, :computer, :integer, default: 0
  	change_column :characters, :crafts, :integer, default: 0
  	change_column :characters, :investigation, :integer, default: 0
  	change_column :characters, :medicine, :integer, default: 0
  	change_column :characters, :occult, :integer, default: 0
  	change_column :characters, :politics, :integer, default: 0
  	change_column :characters, :science, :integer, default: 0
  	change_column :characters, :athletics, :integer, default: 0
  	change_column :characters, :brawl, :integer, default: 0
  	change_column :characters, :drive, :integer, default: 0
  	change_column :characters, :firearms, :integer, default: 0
  	change_column :characters, :larceny, :integer, default: 0
  	change_column :characters, :stealth, :integer, default: 0
  	change_column :characters, :survival, :integer, default: 0
  	change_column :characters, :weaponry, :integer, default: 0
  	change_column :characters, :animal_ken, :integer, default: 0
  	change_column :characters, :empathy, :integer, default: 0
  	change_column :characters, :expression, :integer, default: 0
  	change_column :characters, :intimidation, :integer, default: 0
  	change_column :characters, :persuasion, :integer, default: 0
  	change_column :characters, :socialize, :integer, default: 0
  	change_column :characters, :streetwise, :integer, default: 0
  	change_column :characters, :subterfuge, :integer, default: 0
  end
end
