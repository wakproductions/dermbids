class ChangeQuoteRequestsFormstackDataToText < ActiveRecord::Migration
  def change
    change_column :quote_requests, :formstack_data, :text
  end
end
