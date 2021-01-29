FactoryBot.define do
  factory :item do
    name                { Faker::Games::Pokemon.name }
    description         { Faker::Games::Pokemon.move }
    category_id         {2}
    condition_id        {2}
    shipping_burden_id  {2}
    prefecture_id       {2}
    days_to_ship_id     {2}
    price               {10000}
  end
end
