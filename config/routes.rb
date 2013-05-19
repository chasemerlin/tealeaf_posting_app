Postit::Application.routes.draw do
  resources :posts, except: [:destroy] do
  	resources :comments
  end

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  root to: 'posts#index'
end
