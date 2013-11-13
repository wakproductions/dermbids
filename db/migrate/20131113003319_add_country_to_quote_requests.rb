class AddCountryToQuoteRequests < ActiveRecord::Migration
  def change
    add_column :quote_requests, :country, :string
  end
end
