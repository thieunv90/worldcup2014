class MatchController < ApplicationController
  def index
  end
  def show
    @game = Game.find(params[:game_id])
    @scores = Score.all
    # @current_user_scores =
  end

  def betting
    game = Game.find(params[:game_id])
    unless params[:user_scores].blank?
      if params[:user_scores].size > 3
        flash[:error] = "Cannot bet greater than 3 scores!"
      elsif params[:user_scores].size > 0
        params[:user_scores].each do |score|
          UserScore.create(user_id: current_user.id, score_id: score, game_id: params[:game_id], bid_date: Date.today)
        end
        flash[:notice] = "Successfully!"
      end
    end
    redirect_to :back
  end
end