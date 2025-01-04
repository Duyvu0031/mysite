class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # Đảm bảo email được chuẩn hóa
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
