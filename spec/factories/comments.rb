FactoryBot.define do
  factory :comment do
    content{"MyText"}
    image{"MyString"}
    tbl_name{"MyString"}
    tbl_id{1}
    association :user
  end
end
