class RemoveQuoteRequestFromQuoteRequests < ActiveRecord::Migration
  def change
    remove_column :quote_requests, :quote_request
    add_column :quote_requests, :email, :string
  end
end
