class User < ApplicationRecord
  has_many :artists, foreign_key: :owner_id
  has_many :songs, foreign_key: :owner_id
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  validates_confirmation_of :password
end
