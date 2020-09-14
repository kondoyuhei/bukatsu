# テーブル設計


## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| phone    | string  | null: false |
| admin    | integer | null: false |

### Association

- has_many :posts
- has_many :comments
- has_one :student_detail
- has_one :leader_detail


## student_details テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| grade  | integer    | null: false                    |
| class  | string     | null: false                    |
| parent | string     | null: false                    |

### Association

- belongs_to :user


## leader_details テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| position | integer    | null: false                    |

### Association

- belongs_to :user


## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| content | references | null: false                    |
| user    | references | null: false, foregin_key: true |

### Association

- belongs_to :user
- has_many :post_tags
- has_many :tags, through: :post_tags
- has_many :comments


## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post       | references | null: false, foreign_key: true |
| user       | references | null: false, foregin_key: true |
| comment    | text       | null: false                    |

### Association
- belongs_to :post
- belongs_to :user


## post_tags テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |
| tag    | references | null: false, foregin_key: true |

### Association
- belongs_to :post
- belongs_to :tag


## tags テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| tag      | string     | null: false |

### Association
- has_many :post_tags
- has_many :posts, through: :post_tags
