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
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      # user.password = ENV['GUEST_PASSWORD']
      user.password = "password"
    end
  end
end
