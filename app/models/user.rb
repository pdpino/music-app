class User < ApplicationRecord
  has_many :artists
  has_secure_password
end
