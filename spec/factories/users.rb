FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              {"test1234"}
    password_confirmation {password}
    first_name            {Faker::Name.last_name}
    second_name           {Faker::Name.first_name}
    first_name_kana       {Faker::Name.last_name}
    second_name_kana      {Faker::Name.first_name}
    birthday              {Faker::Number.number(8)}
  end
end