Rails.application.routes.draw do

	devise_for :users

	root 'home#index'

	resources :posts do
		resources :postcomments
	end

    get 'home/language' => 'home#language'
    get 'home/userprofile/:id' => 'home#userprofile'
    get 'home/comment' => 'home#comment'
    get '/filtering' => 'home#filtering'
	get '/users' => 'users#index'
    get '/messages_write/:id' => 'messages#messages_write'
    post '/sending' => 'messages#sending'
    get '/mymessages' => 'messages#mymessages'
    get '/message_delete' => 'message#message_delete'
end
