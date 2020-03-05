FactoryBot.define do
  factory :comment do
    content{Faker::Lorem.paragaph}
    tbl_name{"posts"}
    tbl_id{1}
    association :user
  end
end
