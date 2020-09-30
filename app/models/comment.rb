class Comment < ApplicationRecord
  belongs_to :user # ユーザー
  belongs_to :post # 投稿

  with_options presence: true do
    validates :comment # コメント内容
  end
end
