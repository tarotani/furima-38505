FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"test1234"}
    password_confirmation {password}
    first_name            {"山田"}
    second_name           {"太郎"}
    first_name_kana       {"ヤマダ"}
    second_name_kana      {"タロウ"}
    birthday              {"1970-01-01"}
  end
end