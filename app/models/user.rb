class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  
  validates :password, confirmation: true
  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_set

  private def password_must_be_set
    errors.add(:password, "Missing Password") unless hashed_password.present?
  end
end
