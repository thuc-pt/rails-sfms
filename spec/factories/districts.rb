FactoryBot.define do
  factory :district do
    name{Faker::Address.street_name}
    description{Faker::Lorem.paragraph}
    association :province
  end
end
