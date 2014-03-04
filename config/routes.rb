Midapt::Application.routes.draw do

  devise_scope :user do
    get "sign_out", to: "devise/sessions#destroy"
  end

  devise_for :users

  resources :home, only: :index
  resources :interests
  resources :mind_streams
  resources :marks
  resources :streams
  resources :comments
  resources :minds
  resources :users

  root 'home#index'

  #get 'minds/all' => 'minds#all'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


end
