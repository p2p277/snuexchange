class HomeController < ApplicationController

	def set
		locale = params[:id]
		session[:locale] = locale
		redirect_to :back
	end

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

	def profile
		@users = User.find(params[:id]) #프로필 눌려진 유저

		@cc = Usercomment.where(user_id: params[:id]) #프로필 눌려진 유저에 해당되는 메시지 받아오기
		@pp = User.all
	end

	def comment
		unless current_user.id == params[:user_id]
			comment = Usercomment.where(user_id: params[:user_id], commenter_id: current_user.id).take
			if comment.nil?
				cc = Usercomment.new

				cc.user_id = params[:user_id]
				cc.commenter_id = current_user.id
				cc.content = params[:content]
				cc.score = params[:rating].to_i

				cc.save
			else
				comment.content = params[:content]
				comment.score = params[:rating].to_i


				comment.save
			end
		end


		redirect_to :back, id: params[:user_id]
	end

	def edit

		@users = User.find(params[:id])
	end

	def edit2

		@users = User.find(params[:id])
	end

	def update
		nn = User.find(params[:user_id])
		nn.introductiondeetail = params[:naeyong]
		nn.save
		redirect_to "/home/userprofile/#{nn.id}"
	end

	def update2
		nn = User.find(params[:id])
		nn.plan = params[:plan]
		nn.save
		redirect_to "/home/userprofile/#{nn.id}"
	end


end
