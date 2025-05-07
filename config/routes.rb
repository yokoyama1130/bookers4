Rails.application.routes.draw do
  # リソースの書き方に変更する
  resources :users, only: [:show, :edit]
  # get 'users/show'
  # get 'users/edit'
  resources :post_images, only: [:new, :index, :show, :create]	
  devise_for :users
  root to: "homes#top"
  get '/homes/about', to:'homes#about', as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
