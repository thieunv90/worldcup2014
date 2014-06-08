class HomeController < ApplicationController
  def index
    # if !current_user
    #   redirect_to new_user_session_path
    # end
    @upcoming_games = Game.where( 'play_at > ?', Time.now ).order( 'play_at')
    @past_games     = Game.where( 'play_at < ?', Time.now ).order( 'play_at desc')
  end
end