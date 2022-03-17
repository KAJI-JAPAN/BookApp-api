class Schedule < ApplicationRecord
  belongs_to :post_item, optional: true
	validates :start, presence: true
	validates :end, presence: true
end
