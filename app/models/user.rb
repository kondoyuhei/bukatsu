class User < ApplicationRecord
  has_many :posts          # 投稿
  has_many :comments       # コメント
  has_one  :student_detail # 生徒詳細
  has_one  :leader_detail  # 教員詳細

  with_options presence: true do
    validates :name            # ユーザー名
    validates :password_digest # パスワード（暗号された）
    validates :phone           # 電話番号
    validates :type            # ユーザー種類
  end
end