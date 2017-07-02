Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create]
  get "register" => "users#new"

  resource  :session, only: [:create]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"




  resources :posts do
    resources :comments
  end

  root to: "posts#index"

end
