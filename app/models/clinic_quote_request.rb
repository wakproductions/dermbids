class ClinicQuoteRequest < ActiveRecord::Base
  belongs_to :initiated_by_user, class_name: 'User', foreign_key: :initiated_by_user_id
  belongs_to :clinic
  belongs_to :quote_request
end
