class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts, status: :ok
  end

  def create
    posts = Post.new(create_params)
    if posts.save
      render json: 201, status: :created
    else
      render json: 500,	status: :internal_server_error
    end
  end

  def show
    content = post.post_items
    render json: {"post": post, "content": content}, status: :ok
  end

  def destroy
    if post.destroy
      render json: {}, status: :ok
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
