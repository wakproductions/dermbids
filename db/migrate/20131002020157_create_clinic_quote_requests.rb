class CreateClinicQuoteRequests < ActiveRecord::Migration
  def change
    create_table :clinic_quote_requests do |t|
      t.integer :initiated_by_user_id
      t.string :clinic_id
      t.integer :quote_request_id

      t.timestamps
    end
  end
end
