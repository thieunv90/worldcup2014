class UserGroup < ActiveRecord::Base
  belongs_to :user

  attr_accessible :user_id, :group_id
end