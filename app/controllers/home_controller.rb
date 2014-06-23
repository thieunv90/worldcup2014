class HomeController < ApplicationController
  def index
    # if !current_user
    #   redirect_to new_user_session_path
    # end
    # @upcoming_games = Game.where( 'play_at > ?', Time.now ).order( 'play_at')
    @past_games = Game.where( 'play_at < ?', Time.now ).order( 'play_at, pos')
    @current_games = Game.where( 'play_at < ? AND play_at > ?', Time.now, Time.now - 1.day).order( 'play_at, pos')
    @upcoming_games = Game.where( 'play_at >= ?', Time.now ).order( 'play_at, pos')
    @total_money_for_final = Investment.all.map(&:remaining).sum
  end
end