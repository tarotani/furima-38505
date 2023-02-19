FactoryBot.define do
  factory :order_form do
    postalcode   { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    first_add_id { Faker::Number.between(from: 1, to: 47) }
    second_add   { Faker::Address.city }
    address      { Faker::Address.street_address }
    building     { Faker::Address.street_address }
    tel          { Faker::Number.decimal_part(digits: 11) }
    token        { "tok_abcdefghijk00000000000000000" }
  end
end