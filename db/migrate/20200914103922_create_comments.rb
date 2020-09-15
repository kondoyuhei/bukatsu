class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post,    foreign_key: true # 投稿id（外部参照）
      t.references :user,    foreign_key: true # コメント者id（外部参照）
      t.text       :comment, null: false       # コメント本文
      t.timestamps
    end
  end
end
