FactoryBot.define do
  factory :photo do
    title { Faker::Lorem.characters(number: 40) }
    description { Faker::Lorem.characters(number: 500) }
    price_id { Faker::Number.between(from: 2, to: 6) }
    association :user

    after(:build) do |photo|
      photo.snap.attach(io: File.open('public/img/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
