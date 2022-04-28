class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_normal_user, only: :create

  def ensure_normal_user
    if params[:user][:email].downcase == 'guest@example.com'
      render json: 'ゲストユーザーのパスワード再設定はできません。'
    end
  end
end