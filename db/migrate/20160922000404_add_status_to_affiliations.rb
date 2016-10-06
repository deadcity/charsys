class AddStatusToAffiliations < ActiveRecord::Migration
  def change
    add_column :affiliations, :status, :boolean, default: true
  end
end
