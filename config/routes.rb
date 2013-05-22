Postit::Application.routes.draw do
  resources :posts do
  	resources :comments
  end

  resources :users
  resources :categories

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  root to: 'posts#index'
end
