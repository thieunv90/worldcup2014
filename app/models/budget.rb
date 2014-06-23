class Budget < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  attr_accessible :game_id, :user_id, :total_money_bet, :total_money_win

  after_save :update_investment

  def update_investment
    game = Game.find(self.game_id)
    games_ordered = Game.order(:play_at, :pos)
    index_current_game = games_ordered.index(game)
    money_from_previous_match = game.pos > 1 ? Investment.where(game_id: games_ordered[index_current_game-1].id).first.remaining : 0

    unit_price = game.round.amount
    money_users_bet = 0
    money_company_contribute = 0
    total_budgets_bet = Budget.where(game_id: game.id)
    unless total_budgets_bet.blank?
      total_budgets_bet.each do |user_budget|
        money_users_bet += user_budget.total_money_bet
      end
      money_company_contribute = 3 * unit_price
    end
    total_money = money_users_bet + money_company_contribute
    Investment.find_by_game_id(self.game_id).update_attributes(total: total_money)
  end
end