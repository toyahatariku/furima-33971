FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"abc123"}
    password_confirmation {password}
    first_name            {"山田"}
    second_name           {"太郎"}
    first_name_kana       {"ヤマダ"}
    second_name_kana      {"タロウ"}
    birthday              {"1930-01-01"}
  end
end
