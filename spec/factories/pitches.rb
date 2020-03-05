FactoryBot.define do
  factory :pitch do
    name{Faker::Name.name}
    phone_number{Faker::PhoneNumber.phone_number}
    image{Faker::Avatar.image}
    open_at{Time.now}
    close_at{Time.now + 18.hours}
    description{Faker::Lorem.paragraph}
    active{true}
    email{"example#{Faker::Number.number}@gmail.com"}
    association :user
    association :province
    association :district
    address{Faker::Address.street_address}
  end
end
