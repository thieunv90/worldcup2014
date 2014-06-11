class Game < ActiveRecord::Base
  belongs_to :team1, class_name: "Team", foreign_key: :team1_id
  belongs_to :team2, class_name: "Team", foreign_key: :team2_id
  belongs_to :round
  has_many :user_scores
  attr_accessible :play_at, :deadline, :score1, :score2, :score_id, :locked, :winner

  def play_at_local
    self.play_at + 3.hours
  end

end