FactoryBot.define do
  factory :level do
    name{Faker::Name.name}
    description{Faker::Lorem.paragraph}
  end
end
