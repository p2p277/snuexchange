Rails.application.routes.draw do

	devise_for :users

	root 'home#index'

	resources :posts do
		resources :postcomments
	end

    get 'home/language' => 'home#language'
    get 'home/userprofile/:id' => 'home#profile'
    get 'home/edit/:id' => 'home#edit'
    get 'home/edit2/:id' => 'home#edit2'
    get 'home/comment' => 'home#comment'
    post 'update' => 'home#update'
    post 'update2' => 'home#update2'
    get '/filtering' => 'home#filtering'
	# 상훈이가 추가한 부분.
    get 'language' => 'home#language'
	#
	get '/users' => 'users#index'
    post '/messages_write' => 'messages#messages_write'
    post '/sending' => 'messages#sending'
    get '/mymessages' => 'messages#mymessages'
  	get '/sendm' => 'messages#sendm'
  	get '/sentm' => 'messages#sentm'
  	get '/sendm_detail' => 'messages#sendm_detail'
  	get '/sentm_detail' => 'messages#sentm_detail'
  	get '/sendm_delete' => 'messages#sendm_delete'
  	get '/sentm_delete' => 'messages#sentm_delete'
end
