class ChangeClinicQuoteRequestToClinicCommunication < ActiveRecord::Migration
  def change
    rename_table :clinic_quote_requests, :clinic_communications
    add_column :clinic_communications, :communication_type, :integer
  end
end
