FactoryBot.define do
  factory :booking do
    name{"MyString"}
    phone_number{"MyString"}
    passing_note{"MyText" }
    date{"2020-03-04"}
    price{1}
    status{1}
    association :timesheet
    association :user
    association :team
  end
end
