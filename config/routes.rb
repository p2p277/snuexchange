Rails.application.routes.draw do

	devise_for :users

	root 'home#index'

	resources :posts do
		resources :postcomments
	end

    get 'home/language' => 'home#language'
    get 'language' => 'home#language'
	get '/users' => 'users#index'

end
