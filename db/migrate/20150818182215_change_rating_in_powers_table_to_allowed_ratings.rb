class ChangeRatingInPowersTableToAllowedRatings < ActiveRecord::Migration
  def change
  	rename_column :powers, :rating, :allowed_ratings
  	change_column :powers, :allowed_ratings, :string
  end
end
