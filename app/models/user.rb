class User < ApplicationRecord
  has_many :posts          # 投稿
  has_many :comments       # コメント
  has_one  :student_detail # 生徒詳細
  has_one  :leader_detail  # 教員詳細

  has_secure_password # bcryptパスワード機能

  with_options presence: true do
    validates :name            # ユーザー名
    validates :password_digest # パスワード（暗号された）
    validates :phone           # 電話番号
    validates :admin            # ユーザー種類
  end

  # ****************************************
  #   ユーザーが管理者であるか判定するメソッド
  # ****************************************
  def administrator
    return true if admin == 11

    false
  end

  # ****************************************
  #   ユーザーが生徒であるか判定するメソッド
  # ****************************************
  def student
    return true if admin == 1

    false
  end

  # ****************************************
  #   ユーザーが保護者であるか判定するメソッド
  # ****************************************
  def parent
    return true if admin == 2

    false
  end


  # ****************************************
  #   保護者に対して生徒を返すメソッド
  # ****************************************
  def get_student
    if StudentDetail.find_by(parent1: self.id)
      student_id = StudentDetail.find_by(parent1: self.id).user_id
    elsif StudentDetail.find_by(parent2: self.id)
      student_id = StudentDetail.find_by(parent2: self.id).user_id
    end
    return User.find_by(id: student_id) if student_id
  end

  # ****************************************
  #   生徒に対して保護者1を返すメソッド
  # ****************************************
  def get_parent1
    if StudentDetail.find_by(user_id: self.id)
      parent_id = StudentDetail.find_by(user_id: self.id).parent1
      return User.find_by(id: parent_id)
    end
  end

  # ****************************************
  #   生徒に対して保護者2を返すメソッド
  # ****************************************
  def get_parent2
    if StudentDetail.find_by(user_id: self.id)
      parent_id = StudentDetail.find_by(user_id: self.id).parent2
      return User.find_by(id: parent_id)
    end
  end

end
