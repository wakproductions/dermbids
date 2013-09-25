class Organization < ActiveRecord::Base
  belongs_to :quote_request_contact, class_name: User, foreign_key: :quote_request_contact_user_id
end
