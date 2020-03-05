FactoryBot.define do
  factory :sub_pitch_type do
    name{Faker::Name.name}
    description{Faker::Lorem.paragraph}
  end
end
