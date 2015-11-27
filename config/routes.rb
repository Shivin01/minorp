Rails.application.routes.draw do
  get 'tags/:tag', to: 'pins#index', as: :tag
  devise_for :users
  resources :searches
  resources :friends
  resources :activities
  resources :follows do
    collection do
      get 'create'
    end
  end
 
  resources :users do
    collection do
      get 'show'
    end
  end
  resources :pins do
  	resources :homes, only: [:show]
  	root to: "homes#show"
    resources :download
  	resources :cs

  	member do
  		put "like",to: "pins#upvote"
  	end
    get 'tags/:tag', to: 'pins#index', as: :tag
  end

  root "pins#index"
end
