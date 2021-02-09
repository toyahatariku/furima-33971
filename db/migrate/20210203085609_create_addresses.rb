class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references  :purchase       ,null: false
      t.string      :postal_code    ,null: false, default: ""
      t.integer     :prefecture_id  ,null: false
      t.string      :municipality   ,null: false, default: ""
      t.string      :address        ,null: false, default: ""
      t.string      :building_name              , default: ""
      t.string      :phone_number   ,null: false, default: ""

      t.timestamps
    end
  end
end


# | purchase      | references | null: false, foreign_key: true | //購入履歴ID
# | postal_code   | string     | null: false                    | //郵便番号
# | prefecture_id | integer    | null: false                    | //都道府県
# | municipality  | string     | null: false                    | //市区町村
# | address       | string     | null: false                    | //番地
# | building_name | string     |                                | //建物名
# | phone_number  | string     | null: false                    | //電話番号
