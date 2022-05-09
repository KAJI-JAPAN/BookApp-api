class Api::V1::PostsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    posts = current_api_v1_user.posts.order(created_at: :desc)
    render json: posts, status: :ok
  end

  def create
    posts = Post.new(create_params)
    posts.user_id = current_api_v1_user.id
    if posts.save
      render json: {}, status: :created
    else
      render json: {}, status: :internal_server_error
    end
  end

  def show
    content = post.post_items
    render json: {"post": post, "content": content}, status: :ok
  end

  def destroy
    if post.destroy
      render json: {}, status: :no_content
    else
      render json: {}, status: :internal_server_error
    end
  end

    private
      def post 
        @post ||= Post.find(params[:id])
      end 

      def post_item_params
        [:id, :content, :status, :post_id]
      end

      def create_params
        params.require(:post).permit(:title, :author, :image, post_items_attributes: post_item_params)
      end
end
