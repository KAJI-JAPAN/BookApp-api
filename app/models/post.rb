class Post < ApplicationRecord
	has_many :post_items, dependent: :destroy
	validates :title, presence: true
	validates :author, presence: true
	validates :image, presence: true
	accepts_nested_attributes_for :post_items, allow_destroy: true
end
