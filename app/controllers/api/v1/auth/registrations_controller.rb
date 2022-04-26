class Api::V1::Auth::RegistrationsController <  DeviseTokenAuth::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      render json: "ゲストユーザーの更新・削除はできません"
    end
  end

  private
    def sign_up_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
