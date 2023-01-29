FactoryBot.define do
  factory :item do
    name              {"名前"}
    text              {"テキスト"}
    price             {"300"}
    condition_id      {"2"}
    postage_id        {"2"}
    first_add_id      {"2"}
    send_day_id       {"2"}
    category_id       {"2"}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end

    association :user
  end
end
