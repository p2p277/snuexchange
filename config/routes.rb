Rails.application.routes.draw do

	devise_for :users

	root 'home#index'

	resources :posts do
		resources :postcomments
	end

    get 'home/language' => 'home#language'
    post 'home/userprofile' => 'home#userprofile'
    get 'home/comment' => 'home#comment'
    get '/filtering' => 'home#filtering'

end
