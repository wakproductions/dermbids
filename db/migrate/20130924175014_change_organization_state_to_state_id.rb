class ChangeOrganizationStateToStateId < ActiveRecord::Migration
  def change
    rename_column :organizations, :state, :state_id
  end
end
