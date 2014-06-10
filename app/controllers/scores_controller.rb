class ScoresController < ApplicationController
  def get_score
    score = Score.find(params[:score_id])
    score_result = score.name.split(' - ')
    if score_result[0].to_i == score_result[1].to_i
      is_draw = true
    else
      is_draw = false
    end
    render :json => {is_draw: is_draw}
  end
end