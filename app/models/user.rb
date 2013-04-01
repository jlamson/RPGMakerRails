class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  
  validates :password, confirmation: true
  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_set

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end 
  end

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "NaCl" + salt)
  end

  private 
  def password_must_be_set
    errors.add(:password, "Missing Password") unless hashed_password.present?
  end

  def generate_salt 
    self.salt = self.object_id.to_s + rand.to_s
  end
end
