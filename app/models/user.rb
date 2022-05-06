# frozen_string_literal: true
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :schedules, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  # ゲストログイン用
  def self.create_guest_user
    today = Time.now
    User.where(guest: true).where("created_at <= ?", today).destroy_all
    random_value = SecureRandom.hex(1) # ランダムな2文字の文字列を生成
    random_pass = SecureRandom.hex(6) # ランダムな6文字の文字列を生成
    user_params = {
      name: "guest_#{random_value}",
      email: "guest_#{random_value}@guest.com",
      password: "#{random_pass}",
      guest: true
    }
    User.create!(user_params)
  end
end
