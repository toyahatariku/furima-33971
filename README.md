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
| category         | integer    | null: false                    | //カテゴリー
| condition        | integer    | null: false                    | //商品の状態
| shipping_burden  | integer    | null: false                    | //配送料の負担
| shipping_area    | integer    | null: false                    | //発送元地域
| days_to_ship     | integer    | null: false                    | //発送までの日数
| price            | integer    | null: false                    | //価格

### Association
- belongs_to :users
- belongs_to :purchases

## purchases テーブル
//購入履歴
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true | //購入者ID
| item          | references | null: false, foreign_key: true | //出品品ID
| postal_code   | string     | null: false                    | //郵便番号
| prefectures   | integer    | null: false                    | //都道府県
| municipality  | string     | null: false                    | //市区町村
| address       | string     | null: false                    | //番地
| building_name | string     |                                | //建物名
| phone_number  | string     | null: false                    | //電話番号

### Association
- belongs_to :users
- belongs_to :items
