FactoryBot.define do
  factory :order_address do
    token {'tok_' + Faker::Internet.password}
    postal_code {'123-4567'}
    prefecture {2}
    city {'札幌市'}
    house_number {'1-1'}
    building {'札幌ハイツ'}
    phone_number {'08012345678'}
  end
end
