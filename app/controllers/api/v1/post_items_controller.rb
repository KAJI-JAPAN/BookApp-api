class Api::V1::PostItemsController < ApplicationController
  # post_itemsのIDが存在する場合はupdate、存在しない場合は新規で追加、更に保存できた場合とできなかった場合でif文追加
  def update
    if PostItem.exists?(id: post_params[:id]) 
      post = PostItem.find(post_params[:id])
      if post.update(post_params)
        render json: {}, status: "edit_ok"
      else
        render json: {}, status: "edit_error"
      end
    else
      post = PostItem.new(post_params) 
      if post.save
        render json: {}, status: "create_ok"
      else
        render json: {}, status: "create_error"
      end
    end
  end

  def destroy
    post = PostItem.find(params[:id])

    if post.destroy
      render json: {}, status: "ok"
    else
      render json: {}, status: "error"
    end
  end

  private


    def post_params
      params.require(:post).permit(:id, :content, :status, :post_id)
    end
end
