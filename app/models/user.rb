class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :pic
  validates :username, presence: true, uniqueness: true
  
  has_attached_file :pic  #, styles: { medium: "300x300>", thumb: "100x100>" }
  has_many :systems
  
  validates :password, confirmation: true
  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_set

  def User.authenticate(username, password) 
    if user = find_by_username(username)
      if user.hashed_password == encrypt_password(password, user.salt) 
        user
      end 
    end
  end

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
