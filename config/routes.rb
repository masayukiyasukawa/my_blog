Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  root 'posts#index'
  get '/search', to: 'posts#search'
end
