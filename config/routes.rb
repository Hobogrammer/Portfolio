Portfolio::Application.routes.draw do
  resources :comments

  devise_for :users
  resources :posts
  resources :projects

  root to:"posts#index"
end
