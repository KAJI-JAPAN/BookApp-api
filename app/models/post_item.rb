class PostItem < ApplicationRecord
  belongs_to :post
  has_many :schedules
end
