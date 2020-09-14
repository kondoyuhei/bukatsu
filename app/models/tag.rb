class Tag < ApplicationRecord
  has_many :post_tags                  # 投稿_タグ (中間テーブル)
  has_many :posts, through: :post_tags # 投稿

  validates :tag, presence: true       # タグ
end
