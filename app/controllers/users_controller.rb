class UsersController < ApplicationController
  def statistics
    @user = User.find(params[:id])
    @user_statistics = []

    user_join_games = @user.user_scores.group_by(&:game_id)
    games = Game.where(id: user_join_games.keys).order(:play_at).index_by(&:id)
    user_budgets = @user.budgets
    budgets_with_each_game = user_budgets.index_by(&:game_id)
    @total_money_user_bet = user_budgets.sum(:total_money_bet)
    @total_money_user_win = user_budgets.sum(:total_money_win)
    @total_money_user_get = @total_money_user_win - @total_money_user_bet

    user_join_games.each do |game_id, scores|
      game = games[game_id]
      money_bet = budgets_with_each_game[game_id].total_money_bet
      money_win = budgets_with_each_game[game_id].total_money_win
      @user_statistics << {
        game: game,
        match: "#{game.team1.title} - #{game.team2.title}",
        date_occur: game.play_at_local.strftime('%H:%M %p, %A, %d/%m'),
        total_scores: scores.size,
        money_bet: money_bet,
        money_win: money_win,
        money_get: money_win - money_bet
      }
      @maximum_money_win = @user_statistics.sort{|a,b| b[:money_win] <=> a[:money_win]}.first[:money_win]
    end
  end
end