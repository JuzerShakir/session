class Visitor < ApplicationRecord
  # to store encrypted password in database
  has_secure_password

  # only valid email format allowed
  validates_email_format_of :email, message: "is in invalid format!"
  validates :email, uniqueness: true

  # setting length of password
  validates :password, length: { minimum: 6, maximum: 36 }
end
