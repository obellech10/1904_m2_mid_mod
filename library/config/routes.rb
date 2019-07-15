Rails.application.routes.draw do

  # get '/books', to: 'books#index'

  resources :books, only: [:index]

  resources :authors, only: [:show]

end
