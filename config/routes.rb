Postit::Application.routes.draw do
  resources :posts, except: [:destroy] do
  	resources :comments
  end

  root to: 'posts#index'
end
