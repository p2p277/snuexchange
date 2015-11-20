Rails.application.routes.draw do

	devise_for :users

	root 'home#index'

	resources :posts do
		resources :postcomments
	end

    get 'home/language' => 'home#language'
    post 'home/userprofile' => 'home#userprofile'
    get '/filtering' => 'home#filtering'

end
