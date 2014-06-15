Worldcup2014::Application.routes.draw do
  devise_for :users, :path => "auth", :controllers =>
  { :registrations => "authentication"}
  devise_scope :user do
    get '/auth', :to => "authentication#edit", :as => "authentication"
    get "/login" => "sessions#new", :as => :new_user_session
    post "/login" => "sessions#create", :as => :user_session
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
    get '/auth/change_password', :to => "authentication#change_password", :as => "change_password"
    post '/auth/change_password', :to => "authentication#change_password", :as => "change_password"
  end

  get 'home/index', :to => 'home#index', :as => "home"

  get 'match',          :to => 'match#index'
  get 'match/:game_id', :to => 'match#show', :as => :match_game
  post 'match/:game_id', :to => 'match#betting', :as => :match_betting
  match 'match/:game_id/update_score', :to => 'match#update_score', :as => :match_update_score

  post 'scores/:score_id/get_score', :to => 'scores#get_score', :as => :get_score
  get 'statistics', :to => 'statistics#index'
  get 'users/:id/statistics', :to => 'users#statistics', :as => :user_statistics
  root :to => 'home#index'
end
