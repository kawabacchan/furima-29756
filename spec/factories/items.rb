FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    content {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to:11)}
    item_status_id {Faker::Number.between(from: 2, to:7)}
    delivery_fee_id {Faker::Number.between(from: 2, to:3)}
    seller_area_id {Faker::Number.between(from: 2, to:48)}
    days_to_ship_id {Faker::Number.between(from: 2, to:4)}
    price {Faker::Number.between(from: 300, to:9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end

  end
end
