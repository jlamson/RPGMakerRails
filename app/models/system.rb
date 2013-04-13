class System < ActiveRecord::Base
  attr_accessible :description, :name, :parent_id, :public, :user_id
end
