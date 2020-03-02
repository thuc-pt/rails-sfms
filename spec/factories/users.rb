FactoryBot.define do
  factory :user do
    name{Faker::Name.name}
    email{"mailer#{Faker::Number.number}@gmail.com"}
    password{"123456"}
    password_confirmation{"123456"}
    birthday{Faker::Date.birthday}
    address{Faker::Address.full_address}
    phone_number{Faker::PhoneNumber.phone_number}
    gender{Faker::Boolean.boolean}
    image{Faker::Avatar.image}
    confirmed_at{Time.now}
  end
end
