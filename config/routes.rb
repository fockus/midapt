Midapt::Application.routes.draw do

  apipie #doc restful

  devise_scope :user do
    get "sign_out", to: "devise/sessions#destroy"
  end

  devise_for :users

  #resources :interests
  #resources :mind_streams
  #resources :marks
  resources :streams
  resources :minds do
    resources :comments
    resources :marks
  end
  resources :users

  root 'home#index'
  
  get '/my/minds', to: 'minds#user_index'
end
