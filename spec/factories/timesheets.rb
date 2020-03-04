FactoryBot.define do
  factory :timesheet do
    start_at{"2020-03-04 16:41:53"}
    end_at{"2020-03-04 16:41:53"}
    price{100000}
    association :sub_pitch
  end
end
