class RenameQuoteRequestPatientUserToUser < ActiveRecord::Migration
  def change
    rename_column :quote_requests, :patient_user_id, :user_id
  end
end
