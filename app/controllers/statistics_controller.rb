class StatisticsController < ApplicationController
  def index
    @statistics = []
    all_budgets = Budget.all.group_by(&:user_id)
    users = User.where(id: all_budgets.keys).index_by(&:id)
    all_budgets.each do |user_id, budgets|
      total_money_bet = budgets.sum(&:total_money_bet)
      total_money_win = budgets.sum(&:total_money_win)
      total_money_profits = total_money_win - total_money_bet
      user_scores = UserScore.where(user_id: user_id)
      @statistics << {user: users[user_id], total_matches: user_scores.group_by(&:game_id).size, total_scores: user_scores.size, total_money_bet: total_money_bet, total_money_win: total_money_win, total_money_profits: total_money_profits}
    end
    @statistics = @statistics.sort{|a,b| b[:total_money_profits] <=> a[:total_money_profits]}
  end

  def summary
    # Tong ket vong bang
    @match_with_no_winner = []
    all_budgets_for_each_game = Budget.where(game_id: (1..48).to_a).group_by(&:game_id)
    all_budgets_for_each_game.each do |game_id, budgets|
      if budgets.sum(&:total_money_win)  == 0
        @match_with_no_winner << game_id
      end
    end

    @total_scores = UserScore.where(game_id: (1..48).to_a).size
  end
end