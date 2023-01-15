Rails.application.routes.draw do
  devise_for :users, controllers: {
    registerations: 'registerations' 
  }

  resources :contacts,       only: [:new, :create]
  resources :brands
  resources :cart_items
  resources :carts
  resources :categories
  resources :products 
  

  get 'about'=> 'pages#about_us'
  get 'donate' => 'pages#donate'
  get 'contact'=> 'pages#contact_info'
  # get 'product' => 'pages#product_page'
  # get 'catagory' => 'pages#catagory_page'
  # get 'home/index'
  # get 'home' => 'home#index'
  root "products#index"
end
