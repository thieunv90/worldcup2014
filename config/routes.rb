Worldcup2014::Application.routes.draw do
  get 'home/index', :to => 'home#index', :as => "home"

  get 'live',          :to => 'live#index'
  get 'live/:game_id', :to => 'live#show', :as => :live_game

  root :to => 'home#index'
end
