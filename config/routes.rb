Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/home/about', to: 'homes#about', as: 'about'
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
