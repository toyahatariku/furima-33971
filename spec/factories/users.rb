FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {"123abc"}
    password_confirmation {password}
    first_name            {"山田"}
    second_name           {"太郎"}
    first_name_kana       {"ヤマダ"}
    second_name_kana      {"タロウ"}
    birthday              {Faker::Date.backward}
  end
end
