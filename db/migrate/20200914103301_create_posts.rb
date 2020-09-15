class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :title,   null: false       # 投稿タイトル
      t.text       :content, null: false       # 投稿本文
      t.references :user,    foreign_key: true # 投稿者（外部参照）
      t.timestamps
    end
  end
end
