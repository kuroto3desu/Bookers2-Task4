Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  get "/home/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :edit, :show, :update]
  resources :books, only: [:create, :edit, :index, :show, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
end
