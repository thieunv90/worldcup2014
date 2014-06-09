class Score < ActiveRecord::Base
  has_many :user_scores
  has_and_belongs_to_many :users, join_table: :user_scores

  attr_accessible :name
end