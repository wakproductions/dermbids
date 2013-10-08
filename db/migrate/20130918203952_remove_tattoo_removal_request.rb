class RemoveTattooRemovalRequest < ActiveRecord::Migration
  def change
    drop_table :tattoo_removal_requests
  end
end
