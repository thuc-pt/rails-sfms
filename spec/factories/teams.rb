FactoryBot.define do
  factory :team do
    name{"MyString"}
    logo{"MyString"}
    image{"MyString"}
    average_age{1}
    win{1}
    lost{1}
    description{"MyText"}
    association :user
    association :level
    association :province
    association :pitch
  end
end
