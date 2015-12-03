class HomeController < ApplicationController

	def index
		
	end
	
	def language
	#필터링 기능 구현
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
        
        @p = User.all #모든 프로필 불러와서 변수에 저장
        
		
        
        
		
	end
	
	def comment
        cc = Usercomment.new
        
        cc.user_id = params[:user_id]
        cc.commenter_id = current_user.id
        cc.content = params[:content]
        cc.score = params[:rating].to_i
       
        cc.save
        
        redirect_to :back, id: params[:user_id]
		
	end

end
