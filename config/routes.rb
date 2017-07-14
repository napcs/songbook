Rails.application.routes.draw do
  get 'practice/', to: "practice#index"
  get 'practice/setlist/:id', to: "practice#setlist", as: :practice_setlist
  get 'practice/song', to: "practice#show"

  resources :setlist_songs
  resources :setlists
  resources :songs

  devise_for :users

  root to: "home#index"
end
