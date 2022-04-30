class Api::V1::Auth::RegistrationsController <  DeviseTokenAuth::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  private
    def sign_up_params
      params.permit(:name, :email, :password, :guest)
    end
end
