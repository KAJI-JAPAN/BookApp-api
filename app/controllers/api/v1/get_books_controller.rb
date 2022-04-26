class Api::V1::GetBooksController < ApplicationController
  before_action :authenticate_api_v1_user!

  def search_books
    response_book = GetBook.search(keyword_params[:keyword])
    render json: response_book, status: :ok 
  end

  private

    def keyword_params
      params.permit(:keyword)
    end
end
