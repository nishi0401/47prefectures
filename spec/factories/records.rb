FactoryBot.define do
  factory :record do
    prefecture_id              {'1'}
    content                 {'aaa'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/kumamoto.jpg'), filename: 'kumamoto.jpg')
    end
  end
end