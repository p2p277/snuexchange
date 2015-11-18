Rails.application.routes.draw do

	devise_for :users

	root 'home#index'

	resources :posts do
		resources :postcomments
	end

end
