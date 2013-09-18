class AddBasicFieldsToQuoteRequest < ActiveRecord::Migration
  def change
    add_column :quote_requests, :quote_request, :string
    add_column :quote_requests, :patient_user_id, :integer
    add_column :quote_requests, :full_name, :string
    add_column :quote_requests, :postal_code, :string
    add_column :quote_requests, :formstack_photo_url, :string
  end
end
