class Api::V1::Auth::SessionsController < ApplicationController
  def index
      render json: current_api_v1_user
  end
end
