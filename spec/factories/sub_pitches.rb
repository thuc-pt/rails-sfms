FactoryBot.define do
  factory :sub_pitch do
    name{"MyString"}
    is_new{true}
    description{"MyText"}
    active{true}
    association :pitch
    association :sub_pitch_type
  end
end
