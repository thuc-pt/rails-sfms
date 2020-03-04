FactoryBot.define do
  factory :match do
    association :user
    association :team
    association :province
    association :district
    association :pitch
    association :level
    category{1}
    ward{"MyString"}
    betting{"MyString"}
    time{"2020-03-04 17:13:18"}
    competitor{"MyString"}
    captain_name{"MyString"}
    phone_number{"MyString"}
    invition{"MyText"}
    status{0}
  end
end
