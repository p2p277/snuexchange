Rails.application.routes.draw do

	devise_for :users

	root 'home#index'

	resources :posts do
		resources :postcomments
	end

    get 'home/language' => 'home#language'
    get 'home/userprofile/:id' => 'home#profile'
    get 'home/edit/:id' => 'home#edit'
    get 'home/comment' => 'home#comment'
    post 'update' => 'home#update'
    get '/filtering' => 'home#filtering'
	# 상훈이가 추가한 부분.
    get 'language' => 'home#language'
	#
	get '/users' => 'users#index'
    get '/messages_write/:id' => 'messages#messages_write'
    post '/sending' => 'messages#sending'
    get '/mymessages' => 'messages#mymessages'
    get '/message_delete' => 'message#message_delete'
end
