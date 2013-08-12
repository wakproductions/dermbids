class QuoteRequest < ActiveRecord::Base
  has_many :tattoo_removal_requests
end
