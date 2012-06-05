Shouter::Application.routes.draw do

  get "users/show"

  root to: "welcome#index"

  resource :dashboard, only: [:show]

  resources :users, only: [:show] do
    post "follow" => "following_relationships#create"
  end
  
  resources :text_shouts, only: [:create]
  resources :photo_shouts, only: [:create]
end
