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
        
        redirect_to "/"
		
	end

end
