# source: https://stackoverflow.com/questions/5123972/ruby-on-rails-password-validation
PASSWORD_FORMAT = /\A
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
/x

class User < ApplicationRecord
  has_many :artists, foreign_key: :owner_id
  has_many :songs, foreign_key: :owner_id
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: { if: :password_required?, message: 'password missing.' }, confirmation: true, length: { minimum: 8 }, format: { with: PASSWORD_FORMAT }

  def password_required?
    # FIXME: true when updating password and creating, false when updating info
    false
  end

end
