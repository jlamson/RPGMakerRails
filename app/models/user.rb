class User < ActiveRecord::Base
  attr_accessible :hashed_password, :salt, :username
end
