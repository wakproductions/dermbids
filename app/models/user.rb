class User < ActiveRecord::Base
  TYPES={
      patient: 0,
      provider: 1,
      admin: 100
  }
  scope :admins, ->{ where(user_type: TYPES[:admin]) }
  scope :patients, ->{ where(user_type: TYPES[:patients]) }
  scope :providers, ->{ where(user_type: TYPES[:providers]) }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

end
