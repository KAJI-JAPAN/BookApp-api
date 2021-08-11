class Api::V1::PostsController < ApplicationController
	def index
		posts = Post.all
		render json: posts
	end

	def create
		posts = Post.new(post_params)
		if posts.save
			render json: '作成に成功しました', status: 200
		else
			render json: '作成に失敗しました', status: 500
		end
	end

		private
		 def post_params
			params.require(:post).permit(:title, :author, :image)
		 end
end
