class HomeController < ApplicationController

	def index
		
	end
	
	def language
	
	if !params.has_key? (:sex) or (params[:learn] == "" and params[:teach] == "" and params[:sex] == "")
		@filtered = User.all
		elsif params[:learn] == "" and params[:teach] == ""
		@filtered = User.where("gender LIKE ?", params[:sex])
		elsif params[:learn] == "" and params[:sex] == ""
		@filtered = User.where("language_speak LIKE ?", params[:teach])
		elsif params[:teach] == "" and params[:sex] == ""
		@filtered = User.where("language_learn LIKE ?", params[:learn])
		elsif params[:teach] == ""
		@filtered = User.where("language_learn LIKE ? AND gender LIKE ?", params[:learn], params[:sex])
		elsif params[:learn] == ""
		@filtered = User.where("language_speak LIKE ? AND gender LIKE ?", params[:teach], params[:sex])
		elsif params[:sex] == ""
		@filtered = User.where("language_speak LIKE ? AND language_learn LIKE ?", params[:teach], params[:learn])
		elsif 
		@filtered = User.where("language_speak LIKE ? AND language_learn LIKE ? AND gender LIKE ?", params[:teach], params[:learn], params[:sex])
		end
	end

end
