Portfolio::Application.routes.draw do

  devise_for :users
  resources :projects

  resources :posts do
    resources :comments
  end

  root to:"welcome#index"
end
