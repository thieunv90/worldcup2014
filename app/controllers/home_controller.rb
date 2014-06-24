class HomeController < ApplicationController
  def index
    # if !current_user
    #   redirect_to new_user_session_path
    # end
    # @upcoming_games = Game.where( 'play_at > ?', Time.now ).order( 'play_at')
    @past_games = Game.where(locked: true).order( 'play_at, pos')
    first_game_not_locked = Game.where(locked: false).order( 'play_at, pos').first
    @recent_games = Game.where( 'date(play_at) = ?', first_game_not_locked.play_at.to_date).order( 'play_at, pos')
    @upcoming_games = Game.where(locked: false).where( 'play_at >= ?', Time.now ).order( 'play_at, pos')
    @total_money_for_final = Investment.all.map(&:remaining).sum
  end
end