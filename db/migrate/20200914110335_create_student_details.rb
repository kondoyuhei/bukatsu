class CreateStudentDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :student_details do |t|
      t.references :user,   foreign_key: true # ユーザー（生徒）id （外部参照）
      t.integer    :grade,  null: false       # 学年
      t.string     :class,  null: false       # クラス
      t.integer    :parent                    # ユーザー（保護者）id
      t.timestamps
    end
  end
end
