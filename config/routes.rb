Portfolio::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  scope ":locale" do
    resources :projects

    resources :posts do
      resources :comments
    end
  end

  root to:"welcome#index"
end
