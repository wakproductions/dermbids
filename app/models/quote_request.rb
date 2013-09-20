class QuoteRequest < ActiveRecord::Base
  belongs_to :user

  validates :email, presence: true

  # assign the user if an email exists
  def find_or_create_user
    self.user = User.find_or_create_by(email: self.email) if user.nil? && self.email.present?
  end
end
