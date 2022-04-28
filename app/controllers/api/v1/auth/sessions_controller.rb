class Api::V1::Auth::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in(user)
    render json: user, status: :ok
  end
end
