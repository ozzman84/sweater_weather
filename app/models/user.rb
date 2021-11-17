class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true, on: :create

  before_validation :set_api_key

  private

  def set_api_key
    self.api_key = ApiKey.generator
  end
end
