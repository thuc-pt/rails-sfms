FactoryBot.define do
  factory :like do
    association :user
    tbl_name{"posts"}
    tbl_id{1}
  end
end
