class Round < ActiveRecord::Base
  belongs_to :event
  attr_accessible :amount
end