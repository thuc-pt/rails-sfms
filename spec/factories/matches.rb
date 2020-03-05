FactoryBot.define do
  factory :match do
    association :user
    association :team
    association :province
    association :district
    association :pitch
    association :level
    category{Faker::Number.number(from: 0, to: 1)}
    ward{Faker::Address.street_address}
    betting{Faker::String.random(length: 12)}
    time{Date.current}
    competitor{Faker::Name.name}
    captain_name{Faker::Name.name}
    phone_number{Faker::PhoneNumber.phone_number}
    invition{Faker::Lorem.paragraph}
    status{0}
  end
end
