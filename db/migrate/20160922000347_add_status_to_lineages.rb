class AddStatusToLineages < ActiveRecord::Migration
  def change
    add_column :lineages, :status, :boolean, default: true
  end
end
