class CreateLeaderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :leader_details do |t|
      t.references :user,     foreign_key: true # ユーザー（教員）id （外部参照）
      t.string     :position, null: false       # 役職
      t.timestamps
    end
  end
end
