FactoryBot.define do
  factory :district do
    name{"MyString"}
    description{"MyText"}
    association :province
  end
end
