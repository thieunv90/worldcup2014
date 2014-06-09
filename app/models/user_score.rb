class UserScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :score
  belongs_to :game

  attr_accessible :user_id, :score_id, :game_id, :bid_date
end