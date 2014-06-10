class Investment < ActiveRecord::Base
  belongs_to :game
  attr_accessible :game_id, :total, :remaining
end