# テーブル設計

## users テーブル
//登録者情報
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true | //メールアドレス
| encrypted_password | string | null: false               | //パスワード
| nickname           | string | null: false               | //ニックネーム
| first_name         | string | null: false               | //苗字
| second_name        | string | null: false               | //名前
| first_name_kana    | string | null: false               | //苗字カナ
| second_name_kana   | string | null: false               | //名前カナ
| birthday           | date   | null: false               | //誕生日

### Association
- has_many :items
- has_many :purchases
- has_one  :card

## items テーブル
//出品品
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true | //出品者ID
| name               | string     | null: false                    | //商品名
| description        | text       | null: false                    | //商品説明
| category_id        | integer    | null: false                    | //カテゴリー
| condition_id       | integer    | null: false                    | //商品の状態
| shipping_burden_id | integer    | null: false                    | //配送料の負担
| prefecture_id      | integer    | null: false                    | //発送元地域（都道府県）
| days_to_ship_id    | integer    | null: false                    | //発送までの日数
| price              | integer    | null: false                    | //価格

### Association
- belongs_to :user
- has_one :purchase
- has_many :item_tag
- has_many :items, through: :item_tag_relations

## item_tag テーブル（中間テーブル）
//出品品
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true | //出品商品
| tag                | references | null: false, foreign_key: true | //タグ

### Association
- belongs_to :item
- belongs_to :tag

## tag テーブル
//出品品
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| tag                | string     | null: false                    | //タグ

### Association
- has_many :item_tag
- has_many :tags, through: :item_tag_relations

## purchases テーブル
//購入履歴
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true | //購入者ID
| item          | references | null: false, foreign_key: true | //出品品ID

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
//購入者住所
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key: true | //購入履歴ID
| postal_code   | string     | null: false                    | //郵便番号
| prefecture_id | integer    | null: false                    | //都道府県
| municipality  | string     | null: false                    | //市区町村
| address       | string     | null: false                    | //番地
| building_name | string     |                                | //建物名
| phone_number  | string     | null: false                    | //電話番号

### Association
- belongs_to :purchase

## cards テーブル
//カード情報
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true | //ユーザーID
| card_token     | string     | null: false                    | //カードトークン
| customer_token | string     | null: false                    | //カスタマートークン

### Association
- belongs_to :user