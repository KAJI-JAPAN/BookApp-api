class Api::V1::Auth::GuestsController < ApplicationController
  def create
    user = User.create_guest_user
    render json: { email: user.email, password: user.password }
  end
end
