Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]

  devise_for :users
  get 'about'=> 'pages#about_us'
  get 'donate' => 'pages#donate'
  get 'contact'=> 'pages#contact_info'
  get 'product' => 'pages#product_page'
  # get 'home/index'
  # get 'home' => 'home#index'


  root 'home#index'
end
