FactoryBot.define do
  factory :comment do
    content{Faker::Lorem.paragaph}
    association :user
    association :post
  end
end
