Rails.application.routes.draw do
  # リソースの書き方に変更する
  resources :users, only: [:show, :edit, :update]
  # get 'users/show'
  # get 'users/edit'
  devise_for :users
  root to: "homes#top"
  get '/homes/about', to:'homes#about', as: "about"

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create]
	end 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
