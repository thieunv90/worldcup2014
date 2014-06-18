class HomeController < ApplicationController
  def index
    # if !current_user
    #   redirect_to new_user_session_path
    # end
    # @upcoming_games = Game.where( 'play_at > ?', Time.now ).order( 'play_at')
    @all_games = Game.order( 'play_at')
    @past_games     = Game.where( 'play_at < ?', Time.now ).order( 'play_at desc')
    @total_money_for_final = Investment.all.map(&:remaining).sum
  end
end