class LeaderDetail < ApplicationRecord
  belongs_to :user # ユーザー（教員）

  validates :position, presence: true # 役職
end
