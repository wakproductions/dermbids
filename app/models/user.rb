class User < ActiveRecord::Base
  has_many :quote_requests

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
    u.generate_random_password if new_record?
    u.user_type = TYPES[:patient] # type defaults to patient
  end

  def generate_random_password
    o = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
    random_password = (0...10).map{ o[rand(o.length)] }.join
    self.password = random_password
  end
end
