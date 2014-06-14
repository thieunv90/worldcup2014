# encoding: utf-8
module GameHelper
  def display_score(game)
    if game.winner.blank?
      if game.score1.blank? && game.score2.blank?
        ''
      else
        "#{game.score1} - #{game.score2}"
      end
    else
      score_winner = game.score1 > game.score2 ? game.score1 : game.score2
      score_loser = game.score1 > game.score2 ? game.score2 : game.score1
      "#{game.winner == game.team1_id ? score_winner : score_loser} - #{game.winner == game.team2_id ? score_winner : score_loser}"
    end
  end
end