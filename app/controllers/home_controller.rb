class HomeController < ApplicationController

	def index
	end
	
	def language
		@users = User.all
	end

end
