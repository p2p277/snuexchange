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
end
