class AddStatusToMeritCategories < ActiveRecord::Migration
  def change
    add_column :merit_categories, :status, :boolean, default: true
  end
end
