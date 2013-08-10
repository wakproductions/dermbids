class CreateQuoteRequests < ActiveRecord::Migration
  def change
    create_table :quote_requests do |t|
      t.string :formstack_data

      t.timestamps
    end
  end
end
