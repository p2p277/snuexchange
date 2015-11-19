class HomeController < ApplicationController

	def index
		
	end
	
	def filtering
		@filtered = User.where("language_speak LIKE ? AND language_learn LIKE ? AND gender LIKE ?", params[:learn], params[:teach], params[:sex])
		redirect_to('/home/language')
	end
	
	def language
		@users = User.all
	end

end
