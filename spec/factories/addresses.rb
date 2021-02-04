FactoryBot.define do
  factory :address do
    postal_code       {"634-3810"}
    prefecture_id     {22}
    municipality      {"宮本町"}
    address           {"634番地"}
    building_name     {"スカイツリー"}
    phone_number      {"09012345678"}

    association :purchase
  end
end
# | purchase      | references | null: false, foreign_key: true | //購入履歴ID
# | postal_code   | string     | null: false                    | //郵便番号
# | prefecture_id | integer    | null: false                    | //都道府県
# | municipality  | string     | null: false                    | //市区町村
# | address       | string     | null: false                    | //番地
# | building_name | string     |                                | //建物名
# | phone_number  | string     | null: false                    | //電話番号
