class ChangeClinicQuoteRequestsClinicIdToInteger < ActiveRecord::Migration
  def change
    remove_column :clinic_quote_requests, :clinic_id
    add_column :clinic_quote_requests, :clinic_id, :integer
  end
end
