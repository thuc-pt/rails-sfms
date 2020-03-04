FactoryBot.define do
  factory :like do
    association :user
    tbl_name{"MyString"}
    tbl_id{1}
    deleted_at{"2020-03-04 19:10:15"}
  end
end
