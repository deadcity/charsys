class AddWishlistFieldToCharacter < ActiveRecord::Migration
  def change
  	add_column :characters, :wishlist, :text
  end
end
