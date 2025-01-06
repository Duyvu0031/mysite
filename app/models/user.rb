class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  def self.authenticate_by(email_address:, password:)
    user = find_by(email_address: email_address)
    user if user && user.authenticate(password)
  end
end
