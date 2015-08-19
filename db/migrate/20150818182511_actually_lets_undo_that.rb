class ActuallyLetsUndoThat < ActiveRecord::Migration
  def change
  	remove_column :powers, :allowed_ratings
  	add_column :powers, :rating, :integer
  end
end
