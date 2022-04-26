class Api::V1::Auth::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    # redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
    render json: user, status: :ok
  end
end
