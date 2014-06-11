class Game < ActiveRecord::Base
  belongs_to :team1, class_name: "Team", foreign_key: :team1_id
  belongs_to :team2, class_name: "Team", foreign_key: :team2_id
  belongs_to :round
  has_many :user_scores
  attr_accessible :play_at, :deadline, :score1, :score2, :score_id, :locked, :winner, :time_zone

  def play_at_local
    if self.time_zone == -3
      self.play_at + 10.hours
    elsif self.time_zone == -4
      self.play_at + 11.hours
    end
  end

end