Portfolio::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :projects

  resources :posts do
    resources :comments
  end


  root to:"welcome#index"
end
