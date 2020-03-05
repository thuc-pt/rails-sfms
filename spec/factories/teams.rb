FactoryBot.define do
  factory :team do
    name{Faker::Name.name}
    logo{Faker::Avatar.image}
    image{Faker::Avatar.image}
    average_age{Faker::Number.number(from: 10, to: 50)}
    win{0}
    lost{0}
    description{Faker::Lorem.paragraph}
    association :user
    association :level
    association :province
    association :pitch
  end
end
