class User < ApplicationRecord
  before_create :key_gen

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  has_secure_password

  private

  def key_gen
    self.api_key = SecureRandom.hex(32)
  end
end