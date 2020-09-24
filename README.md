# 部活動連絡アプリケーション


## アプリケーション概要
　学校において教員・生徒間の連絡ができるサイトを作成しました。教員が連絡をサイトに投稿すると生徒がメッセージを閲覧できます。生徒はメッセージに対してコメントを投稿することもできます。ログインすれば保護者も教員から生徒に当てたメッセージを閲覧することができます。教員・生徒がどのようなやり取りをしているか透明性を確保しつつ、連絡の内容はログインしたユーザーだけ見ることができにしてプライバシーを確保しています。部活動やクラスなどの連絡掲示板サイトとして活用できるのを期待しています。

## アプリケーションの公開

　まだ用意できておりません。（10月前半ごろ公開予定）

### URL
　準備中

### テスト用アカウント
　準備中

### 利用方法
　連絡のタイトル一覧はログインしなくとも閲覧できます。連絡の詳細を見たりコメントを投稿したりするには名前・パスワードでログインする必要があります。


## アプリケーション作成の経緯

### 課題
　学校では部活動やクラスなどにおいて教員と生徒、または教員と保護者が学校外で直接連絡をとらなければならないことがあります。教員・生徒・保護者が直接連絡先を交換することは原則禁止としている学校が大半です。しかし現実には多くの教員が生徒・保護者とLINEのようなSNSアカウントや携帯電話の番号を交換して連絡を取らざるを得ないのが実情です。

　教員と生徒・保護者とが直接連絡先を交換することは、教員と生徒が不適切な関係を持ったり、学校の認知しない場所において教員と保護者がトラブルを抱えたりする恐れがあります。また、プライベートな用途での使用が多いLINEアカウントや電話番号を学校のフォーマルな場で知らせることにより、仲が良いとは限らない人にもプライベートの連絡先を知らせなければならず、プライベートな場とフォーマルの場の境が曖昧になってしまいます。

### 意図
　教員と生徒・保護者が周囲の目の届かない所で一対一の連絡を取るのを避け、オープンな場所で連絡をとれるようにするのがトラブルを防ぐためにも安心です。一方で、関係者でなければ連絡が見えないようにしてプライバシーを確保する必要もあります。透明性を確保しつつもプライバシーを確保した連絡プラットフォームが必要と考えます。

　既存のSNSアカウントを用いるのではなく、ブラウザでアクセスできる独自のウェブサイトを用いることにより、プライベートなアカウントを多数の他人に知らせることなく連絡を取ることが可能になります。

### 対策
　教員・生徒・保護者がウェブサイトでログインをした場合に連絡をできるようにしました。教員が連絡事項を投稿すると、生徒はそれを閲覧できます。生徒は教員の投稿した連絡に対して、必要であれば簡単なコメントすることができます。保護者は教員と生徒がどのような連絡をしているか閲覧できます。

　教員・生徒間のやり取りに保護者が過度に関わることは生徒の自律性を育む上で好ましくありません。一方でやり取りが保護者の目に全く届かないのも望ましいものではありません。今回作成したアプリケーションでは保護者が教員に問い合わせをする場合は学校に直接連絡してもらうことにし、保護者は閲覧のみができるようにしています。


## 洗い出した要件

### ユーザー登録機能
 - ユーザー登録ができる
 - ログインした人だけが詳しい情報にアクセスできる
 - ユーザーに異なる区分（教員・生徒・保護者）がある

### お知らせの投稿機能
 - 教員だけが投稿できる
 - トップページにはタイトルの一覧が表示される
 - 詳細ページはログインしたすべてのユーザーが閲覧できる

### コメントの投稿機能
 - 教員・生徒だけが投稿でき、保護者は閲覧だけができる
 - 投稿した本人は自分のコメントを編集できる
 - コメントの投稿者がわかる

## 実装した機能の動作イメージ

![トップページ](https://lh3.googleusercontent.com/pw/ACtC-3cn0goRsIdOXPLm8jpEWNMG1wDFrhYlQ8KhsmKKOcb7VBRUQQaGmIkgvbiNML3fMrZqxDbwIAZVEEM2yOWeztwUFfMkTGmhYwAOsNajcDOhOvzahZyRgd1tTnD_2Agz5aPj_EC6LWerjACCbiOEgW4=w1437-h695-no)
写真　トップページ

![ログイン画面](https://lh3.googleusercontent.com/pw/ACtC-3dVAvgw-_yxyADMKblVQwUuyBrCtJDAgaqlxXwqXAf35MBh8ipJqoplWF0F-pBmayu6KniuwCISmxtOuEsijVsHbL1GkULaxrI7rB2SNkG1p0hh8PCaHnYtoYPpiQETG1-epRDDZChku_TxGF86iHo=w1437-h695-no)
写真　ログイン画面

![投稿の詳細](https://lh3.googleusercontent.com/pw/ACtC-3cjhvWIcmpJBjcVylXikiXMtBmdeRcsboJGtCAPdgJDQrwnwPmBm47Jiw-en4peNw8LYdUEL38mLHwlU48hTlePrgz2VwcF3SxbQYJSqyHTkJ3a5CWbrJ-vHIexZsffoYn0pr0EPcEXyA-FngwPYS4=w1440-h647-no)
写真　投稿の詳細ページ

![ユーザー編集ページ](https://lh3.googleusercontent.com/pw/ACtC-3fsxWQRrN-6iBI4DsWlFuEeh2cSSagPDMiAcztzK7JJNQv9LbDiO6WrvBHASRzcghlEvXj-QNLd8Co2KNVJq3DAsK6IO7hKfC2f4TuvlL1RBoxv5NmLYzO5KpCQ8VEz0ZZs7EnE7iYtvP1JMQcpyNo=w1440-h647-no)
写真　ユーザー編集ページ

![投稿編集ページ](https://lh3.googleusercontent.com/pw/ACtC-3chMVKwD2DmHVDQMiDTnZG-cGCtmGmGUc97KqzCUIzBtRzcxnmqFagrRG6rYdja0mtAYVSQ9mDpXFiY1BEphYDgvwlqF5dujPeIKPDh40vjFyO0SCWWSlrNiYkntxYmxz3tzLfXaw72IDfizSClm9Y=w1437-h695-no)
写真　投稿編集ページ

## 実装予定の機能

### スマートフォン・タブレットへの表示の対応
 - スマートフォンでもストレスなく表示できる

### タグ付け機能
 - 投稿へのタグ付けができる
 - 特定のタグが付けられた投稿だけを表示できる

### マイページ機能
 - 自分の登録情報を編集できる

### 請求書の表示機能
 - 個人宛の請求書を表示できる

### ダイレクトメッセージ機能
 - 生徒・教員の間でメッセージを投稿できる
 - 教員宛メッセージは他の教員も閲覧できる


## テーブル設計

![テーブル設計ER図](https://lh3.googleusercontent.com/pw/ACtC-3dAe21627O2u_YJ7-QGuV2jANUDm_ZnCfLqSkCI94A4FdEvrh6YfCGPSqi-jVEfrfOSeWjKka_A8Hxa_FXUhMay7R_u-jC7RrB6LusDYFmXH4ilwy3l9SOMOx9AOP-LlJUsxQWFqcA9ThYsnTdViUM=w810-h612-no)

図　テーブル設計ER図

## users テーブル

| Column   | Type    | Options     |
|:---------|:--------|:------------|
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

| Column  | Type       | Options                        |
|:--------|:-----------|:-------------------------------|
| user    | references | null: false, foreign_key: true |
| grade   | integer    | null: false                    |
| class   | string     | null: false                    |
| parent1 | integer    |                                |
| parent2 | integer    |                                |

### Association

- belongs_to :user


## leader_details テーブル

| Column   | Type       | Options                        |
|:---------|:-----------|:-------------------------------|
| user     | references | null: false, foreign_key: true |
| position | integer    | null: false                    |

### Association

- belongs_to :user


## posts テーブル

| Column  | Type       | Options                        |
|:--------|:-----------|:-------------------------------|
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
|:-----------|:-----------|:-------------------------------|
| post       | references | null: false, foreign_key: true |
| user       | references | null: false, foregin_key: true |
| comment    | text       | null: false                    |

### Association
- belongs_to :post
- belongs_to :user


## post_tags テーブル

| Column | Type       | Options                        |
|:-------|:-----------|:-------------------------------|
| post   | references | null: false, foreign_key: true |
| tag    | references | null: false, foregin_key: true |

### Association
- belongs_to :post
- belongs_to :tag


## tags テーブル

| Column   | Type       | Options     |
|:---------|:-----------|:------------|
| tag      | string     | null: false |

### Association
- has_many :post_tags
- has_many :posts, through: :post_tags

## ローカルでの動作方法

### 必要な環境
 - Ruby 2.6.5 以上
 - Rails 6.0.0 以上
 - MySQL

### 動作方法
 1. git cloneしてください。
 2. アプリケーションのルートフォルダ(bukatsu)に移動し、「bundle install」を実行してください。
 3. 「rails db:create」を実行してください。
 4. 「rails s」を実行してください。
 5. 初回は「localhost:3000/」
