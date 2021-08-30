class PostItem < ApplicationRecord
belongs_to :post
# 保存確認後 allow_blank: true追加
# validates :post_id, presence: true

end
