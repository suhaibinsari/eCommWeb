Rails.application.routes.draw do
  devise_for :users

  resources :contacts, only: [:new, :create]
  resources :about_us

  get 'about'=> 'pages#about_us'
  get 'donate' => 'pages#donate'
  get 'contact'=> 'pages#contact_info'
  get 'product' => 'pages#product_page'
  get 'catagory' => 'pages#catagory_page'
  # get 'home/index'
  # get 'home' => 'home#index'


  root 'home#index'
end
