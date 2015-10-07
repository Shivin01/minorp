Rails.application.routes.draw do
  
  devise_for :users
  resources :searches
  resources :pins do
  	resources :homes, only: [:show]
  	root to: "homes#show"

  	resources :cs

  	member do
  		put "like",to: "pins#upvote"
  	end
  end

  root "pins#index"
end
