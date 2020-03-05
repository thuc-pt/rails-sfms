FactoryBot.define do
  factory :timesheet do
    start_at{Time.now}
    end_at{Time.now + 1.hour}
    price{Faker::Number.number(digits: 6)}
    association :sub_pitch
  end
end
