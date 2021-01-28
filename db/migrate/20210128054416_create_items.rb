class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user                  ,null: false, default: ""
      t.string     :name                  ,null: false, default: ""
      t.text       :description           ,null: false, default: ""
      t.integer    :category_id           ,null: false, default: ""
      t.integer    :condition_id          ,null: false, default: ""
      t.integer    :shipping_burden_id    ,null: false, default: ""
      t.integer    :prefecture_id         ,null: false, default: ""
      t.integer    :days_to_ship_id       ,null: false, default: ""
      t.integer    :price                 ,null: false, default: ""
      

      t.timestamps
    end
  end
end


| name               | string     | null: false                    | //商品名
| description        | text       | null: false                    | //商品説明
| category_id        | integer    | null: false                    | //カテゴリー
| condition_id       | integer    | null: false                    | //商品の状態
| shipping_burden_id | integer    | null: false                    | //配送料の負担
| prefecture_id      | integer    | null: false                    | //発送元地域（都道府県）
| days_to_ship_id    | integer    | null: false                    | //発送までの日数
| price              | integer    | null: false                    | //価格