FactoryBot.define do
  factory :purchase_address do
    purchase          { 546 }
    postal_code       {"634-3810"}
    prefecture_id     {22}
    municipality      {"宮本町"}
    address           {"634番地"}
    building_name     {"スカイツリー"}
    phone_number      {"09012345678"}

    association :purchase
  end
end
