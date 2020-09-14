class StudentDetail < ApplicationRecord
  belongs_to :user # ユーザー（生徒）

  with_options presence: true do
    validates :grade # 学年
    validates :class # クラス
  end
end
