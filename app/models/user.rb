class User < ApplicationRecord
  has_many :artists, foreign_key: :owner_id
  has_many :songs, foreign_key: :owner_id
  has_secure_password
end
