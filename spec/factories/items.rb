FactoryBot.define do
  factory :item do
    name { 'hoge' }
    information { Faker::Lorem.sentence }
    condition_id { 2 }
    category_id { 2 }
    state_id { 2 }
    deliveryday_id { 2 }
    item_price { '9999' }
    shipping_id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
