class AddStatusToMerits < ActiveRecord::Migration
  def change
    add_column :merits, :status, :boolean
  end
end
