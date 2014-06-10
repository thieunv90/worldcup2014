# encoding: utf-8
module GameHelper
  def display_score(game)
    if game.winner.blank?
      if game.score1.blank? && game.score2.blank?
        "-:-"
      else
        "#{game.score1} - #{game.score2}"
      end
    else
      "#{game.winner == game.team1_id ? game.score1 : game.score2} - #{game.winner == game.team2_id ? game.score1 : game.score2}"
    end
  end
end