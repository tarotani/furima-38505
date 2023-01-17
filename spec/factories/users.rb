FactoryBot.define do
  factory :user do
    nickname              {'abc'}
    email                 {'kkk@gmail.com'}
    password              {'abc00000'}
    password_confirmation {password}
    first_name            {"山田"}
    second_name           {"太郎"}
    first_name_kana       {"ヤマダ"}
    second_name_kana      {"タロウ"}
    birthday              {"1111"}
  end
end