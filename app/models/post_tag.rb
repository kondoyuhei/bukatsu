class PostTag < ApplicationRecord
  belongs_to :post # 投稿
  belongs_to :tag  # タグ
end
