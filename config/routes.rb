Portfolio::Application.routes.draw do
  resources :posts
  resources :projects

  root to:"posts#index"
end
