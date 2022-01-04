class PostItemsController < ApplicationController
  def create
     @post = PostItem.new(create_params)
     if @post.save
        render json: 201, status: :created
      else
        render json: 500,	status: :internal_server_error
      end
  end

  private
    def create_params
      params.require(:post).permit(post_items: postItemsAttributes)
    end
end
