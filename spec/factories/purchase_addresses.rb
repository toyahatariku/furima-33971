FactoryBot.define do
  factory :purchase_address do
    purchase_id       { 546 }
    postal_code       { '634-3810' }
    prefecture_id     { 22 }
    municipality      { '宮本町' }
    address           { '634番地' }
    building_name     { 'スカイツリー' }
    phone_number      { '09012345678' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
