class Api::V1::GuestsController < ApplicationController
  def create
    random_value = SecureRandom.hex(1) # ランダムな2文字の文字列を生成
    random_pass = SecureRandom.hex(6) # ランダムな6文字の文字列を生成
    user_params = {
      name: "guest_#{random_value}",
      email: "guest_#{random_value}@guest.com",
      password: "#{random_pass}",
      guest: true
    }
    user = User.create!(user_params)
    render json: { email: user.email, password: user.password }
  end
end
