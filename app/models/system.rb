class System < ActiveRecord::Base
  attr_accessible :description, :name, :parent_id, :public, :user_id
  belongs_to :user
  belongs_to :system
  has_one :system
end
