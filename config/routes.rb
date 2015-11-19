Rails.application.routes.draw do

	devise_for :users

	root 'home#index'

    get 'home/language' => 'home#language'
    get '/filtering' => 'home#filtering'

	resources :posts

end
