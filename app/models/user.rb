class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :full_name, :admin, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :user_scores
  has_and_belongs_to_many :scores, join_table: :user_scores

  def display_name
    return self.full_name unless self.full_name.blank?
    return self.email
  end
end
