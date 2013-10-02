class User < ActiveRecord::Base
  has_many :quote_requests
  has_many :clinics, foreign_key: :quote_request_contact_user_id
  has_many :clinic_quote_requests, foreign_key: :initiated_by_user_id

  TYPES={
      patient: 0,
      provider: 1,
      admin: 100
  }
  scope :admins, ->{ where(user_type: TYPES[:admin]) }
  scope :patients, ->{ where(user_type: TYPES[:patients]) }
  scope :providers, ->{ where(user_type: TYPES[:providers]) }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :user_type, presence: true

  after_initialize do |u|
    if new_record?
      u.generate_random_password
      u.user_type = TYPES[:patient]
    end
  end

  def generate_random_password
    o = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
    random_password = (0...10).map{ o[rand(o.length)] }.join
    self.password = random_password
  end
end
