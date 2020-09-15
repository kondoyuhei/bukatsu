class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string     :name,            null: false # ユーザー名
      t.string     :password_digest, null: false # パスワード（暗号化されたもの）
      t.string     :phone,           null: false # 電話番号
      t.string     :email                        # Eメール
      t.integer    :type,            null: false # ユーザー種類
      t.timestamps
    end
  end
end
