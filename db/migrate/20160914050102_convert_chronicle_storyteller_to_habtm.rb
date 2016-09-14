class ConvertChronicleStorytellerToHabtm < ActiveRecord::Migration
  def change
  	rename_table :user_administers_chronicles, :chronicles_users
  end
end
