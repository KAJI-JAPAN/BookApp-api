class Post < ApplicationRecord
	# has_many :post_items, dependent: :destroy
	# accepts_nested_attributes_for :post_items, allow_destroy: true

	validates :title, presence: true
	validates :author, presence: true
	validates :image, presence: true
end
