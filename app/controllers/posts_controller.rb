class PostsController < ApplicationController

	before_filter :authenticate_user!, :except => [:index, :show, :tagged, :unanswered]

	def index
		@posts = Post.order("created_at DESC")
	end

	def new
	end

	def create
		new_post = Post.new(post_params)
		new_post.user_id = current_user.id
		new_post.save
		redirect_to posts_path
	end

	def show
		@post = Post.find(params[:id])
		@post.count += 1
		@post.save
	end

	def edit
		if current_user.id != Post.find(params[:id]).user_id
			redirect_to :back
		end
		@post = Post.find(params[:id])
	end

	def update
		edited_post = Post.find(params[:id])
		edited_post.title = edit_post_params[:title]
		edited_post.text = edit_post_params[:text]
		edited_post.save

		redirect_to post_path(params[:id])
	end

	def destroy
		destroying_post = Post.find(params[:id])
		destroying_post.flag = false
		destroying_post.save

		redirect_to posts_path
	end

	private
		def post_params
			params.require(:new_post).permit(:title, :text)
		end

		def edit_post_params
			params.require(:edit_post).permit(:title, :text)
		end

end
