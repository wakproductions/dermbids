class AddPhotoToQuoteRequest < ActiveRecord::Migration
  def self.up
    add_attachment :quote_requests, :photo
  end

  def self.down
    remove_attachment :quote_requests, :photo
  end
end
