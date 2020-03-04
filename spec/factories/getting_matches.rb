FactoryBot.define do
  factory :getting_match do
    association :match
    association :user
    association :team
    association :province
    association :district
    association :pitch
    message{"MyText"}
  end
end
