class Api::V1::PostItemsController < ApplicationController
  before_action :authenticate_api_v1_user!
  # post_itemsのIDが存在する場合はupdate、存在しない場合は新規で追加、更に保存できた場合とできなかった場合でif文追加
  def update
    if PostItem.exists?(id: post_params[:id]) 
      post = PostItem.find(post_params[:id])
      if post.update(post_params)
        render json: post, status: :created
      else
        render json: post, status: :bad_request
      end
    else
      post = PostItem.new(post_params) 
      if post.save
        render json: post, status: :created
      else
        render json: post, status: :bad_request
      end
    end
  end

  def destroy
    post = PostItem.find(params[:id])
    post.destroy!
    render json: { status: :no_content, message: 'Deleted', data: post }
  end

  private


    def post_params
      params.require(:post).permit(:id, :content, :status, :post_id)
    end
end
