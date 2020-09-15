class CreatePostTags < ActiveRecord::Migration[6.0]
  def change
    create_table :post_tags do |t|
      t.references :post, foreign_key: true # 投稿id
      t.references :tag,  foreign_key: true # タグid
      t.timestamps
    end
  end
end
