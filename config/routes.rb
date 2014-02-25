Portfolio::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :projects do
    resources :comments
  end

  resources :posts do
    resources :comments
  end

match 'contact' => 'contact#new', :via => :get
match 'contact' => 'contact#create', :via => :post

  root to:"welcome#index"
end
