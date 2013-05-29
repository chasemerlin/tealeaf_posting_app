Postit::Application.routes.draw do
  resources :posts do
  	member do
  		post 'vote'
  	end
  	resources :comments do
  		member do
  			post 'vote'
  		end
  	end
  end

  resources :users
  resources :categories

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  root to: 'posts#index'
end
