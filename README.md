# テーブル設計

## users テーブル
//登録者情報
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false | //メールアドレス
| encrypted_password | string | null: false | //パスワード
| nickname           | string | null: false | //ニックネーム
| first_name         | string | null: false | //苗字
| second_name        | string | null: false | //名前
| first_name_kana    | string | null: false | //苗字カナ
| second_name_kana   | string | null: false | //名前カナ
| birthday           | date   | null: false | //誕生日

### Association
- has_many :items
- has_many :purchases

## items テーブル
//出品品
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true | //出品者ID
| name             | string     | null: false                    | //商品名
| description      | string     | null: false                    | //商品説明
| category         | string     | null: false                    | //カテゴリー
| condition        | string     | null: false                    | //商品の状態
| shipping_burden  | string     | null: false                    | //配送料の負担
| shipping_area    | string     | null: false                    | //発送元地域
| days_to_ship     | string     | null: false                    | //発送までの日数
| price            | integer    | null: false                    | //価格

### Association
- belongs_to :users
- belongs_to :purchases
- belongs_to :images

## purchases テーブル
//購入履歴
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true | //購入者ID
| item_id       | references | null: false, foreign_key: true | //出品品ID
| postal_code   | integer    | null: false                    | //郵便番号
| prefectures   | string     | null: false                    | //都道府県
| municipality  | string     | null: false                    | //市区町村
| address       | string     | null: false                    | //番地
| building_name | string     |                                | //建物名
| phone_number  | integer    | null: false                    | //電話番号

### Association
- belongs_to :users
- belongs_to :items
- belongs_to :cards

## cards テーブル
//カード情報
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| purchase_id     | references | null: false, foreign_key: true | //購入履歴ID
| card_number     | integer    | null: false                    | //カード番号
| expiration_date | integer    | null: false                    | //有効期限
| security_code   | integer    | null: false                    | //セキュリティコード

### Association
- belongs_to :purchases
