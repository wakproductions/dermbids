class AddStatusToQuoteRequest < ActiveRecord::Migration
  def change
    add_column :quote_requests, :status, :integer
    QuoteRequest.all.each do |q|
      if q.clinic_communications.present?
        q.status = QuoteRequest::STATUS[:active]
      else
        q.status = QuoteRequest::STATUS[:new]
      end
      q.save!
    end
  end
end
