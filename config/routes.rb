Rails.application.routes.draw do
  get 'search', to: "search#index"
  get 'cart/show'
  devise_for :users, controllers: {
    registerations: 'registerations' 
  }


  resources :products do
    get 'search' , on: :member
  end
  resources :contacts,   only: [:new, :create]
  resources :brands
  resources :categories
  resources :comments



  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  post 'checkout/create', to: 'checkout#create'

  get 'about'=> 'pages#about_us'
  get 'donate' => 'pages#donate'
  # get 'product' => 'pages#product_page'
  # get 'catagory' => 'pages#catagory_page'
  # get 'home/index'
  # get 'home' => 'home#index'
  root "products#index"
end
