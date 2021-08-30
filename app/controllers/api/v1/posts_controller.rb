class Api::V1::PostsController < ApplicationController
	def index
		posts = Post.all
		render json: posts
	end

	def create
		posts = Post.new(post_params)
		if posts.save
			render json: 'OK', status: 200
		else
			render json: 'EEEOR', status: 500
		end
	end

	def show
		post = Post.find(params[:id])
		content = post.post_items
		render json: {"post": post, "content": content}, status: 200
 	end

		private
		 def post_params
			params.require(:post).permit(:title, :author, :image, post_items_attributes: [:id, :content, :status])
		 end
end
