class Visitor < ApplicationRecord
  # to store encrypted password in database
  has_secure_password

  # only valid email format allowed
  validates :email, format: { with: /\A[^@\s]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i, message: "Invalid email format!"}, uniqueness: true

  # setting length of password and passowrd confirmation
  validates :password, length: { minimum: 6, maximum: 36 }, confirmation: true
  validates :password_confirmation, presence: true
end
