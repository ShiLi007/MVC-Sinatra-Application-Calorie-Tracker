class User < ActiveRecord::Base
  has_secure_password
  has_many :days
  has_many :intakes, through: :days
end