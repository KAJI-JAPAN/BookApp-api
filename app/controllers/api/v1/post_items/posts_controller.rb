class Api::V1::PostItems::PostsController < ApplicationController
	def index
		posts = PostItem.all
		render json: posts
	end

	def create
		posts = PostItem.new(post_params)
		if posts.save
			render json: posts
		else
			render json: '作成に失敗しました', status: 500
		end
	end

	def update
		posts_all = PostItem.all
		posts = PostItem.find(params[:id])
		# if posts.status
		posts.update(id: post_params[:id], content: post_params[:content], status: false)
		render json: posts_all
		# else
		# 	render json: '編集できません'
		# end
	end

	def destroy
		posts_all = PostItem.all
		posts = PostItem.find(params[:content_id])
		posts.destroy!
		render json: posts_all
	end

		private
			def post_params
				params.require(:post_items).permit(:id, :content, :status)
			end
end
