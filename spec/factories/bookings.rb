FactoryBot.define do
  factory :booking do
    name{Faker::Name.name}
    phone_number{Faker::PhoneNumber.phone_number}
    passing_note{Faker::Lorem.paragraph}
    date{Date.current}
    price{Faker::Number.number(digits: 6)}
    status{0}
    association :timesheet
    association :user
    association :team
  end
end
