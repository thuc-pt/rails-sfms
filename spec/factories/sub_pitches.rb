FactoryBot.define do
  factory :sub_pitch do
    name{Faker::Name.name}
    is_new{true}
    description{Faker::Lorem.paragraph}
    active{true}
    association :pitch
    association :sub_pitch_type
  end
end
