FactoryBot.define do
  factory :post do
    content{"MyText"}
    association :user
    association :team
  end
end
