FactoryBot.define do
  factory :province do
    name{Faker::Address.city}
    description{Faker::Lorem.paragraph}
  end
end
