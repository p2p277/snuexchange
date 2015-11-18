class PostcommentsController < ApplicationController

	before_filter :authenticate_user!

	def create
		new_comment = Postcomment.new(comment_params)
		new_comment.post_id = params[:post_id]
		new_comment.user_id = current_user.id
		new_comment.save

		redirect_to post_path(params[:post_id])
	end

	def destroy
		destroying_comment = Postcomment.find(params[:id])
		destroying_comment.flag = false
		destroying_comment.save

		redirect_to post_path(destroying_comment.post)
	end

	private
		def comment_params
			params.require(:new_comment).permit(:text)
		end
end
