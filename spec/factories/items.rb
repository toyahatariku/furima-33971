FactoryBot.define do
  factory :item do
    name                { Faker::Games::Pokemon.name }
    description         { Faker::Lorem.sentence }
    category_id         { 2 }
    condition_id        { 2 }
    shipping_burden_id  { 2 }
    prefecture_id       { 2 }
    days_to_ship_id     { 2 }
    price               { 10_000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end

    association :user
  end
end
