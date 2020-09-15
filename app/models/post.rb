class Post < ApplicationRecord
  has_many   :comments                  # コメント
  has_many   :post_tags                 # 投稿_タグ（中間テーブル）
  has_many   :tags, through: :post_tags # タグ
  belongs_to :user                      # ユーザー

  with_options presence: true do
    validates :title   # 投稿タイトル
    validates :content # 投稿内容
  end
end
