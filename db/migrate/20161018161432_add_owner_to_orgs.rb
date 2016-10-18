class AddOwnerToOrgs < ActiveRecord::Migration
  def change
    add_column :orgs, :owner_id, :integer
  end
end
