FactoryBot.define do
  factory :pitch do
    name{Faker::Name.name}
    phone_number{"0123456789"}
    open_at{"04:00"}
    close_at{"22:00"}
    description{Faker::Lorem.paragraph}
    active{true}
    email{"example123@gmail.com"}
    association :user
    association :province
    association :district
    address{Faker::Address.street_address}
  end
end
