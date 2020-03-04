FactoryBot.define do
  factory :pitch do
    name {"MyString"}
    phone_number{"MyString"}
    image{"MyString"}
    open_at{"2020-03-04 16:33:21"}
    close_at{"2020-03-04 16:33:21"}
    description{"MyText"}
    active{true}
    email{}
    association :user
    association :province
    association :district
    address{"MyString"}
  end
end
