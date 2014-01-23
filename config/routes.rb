Portfolio::Application.routes.draw do
  devise_for :users
  resources :posts
  resources :projects

  root to:"posts#index"
end
