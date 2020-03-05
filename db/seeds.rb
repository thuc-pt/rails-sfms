User.create([
  {name: "Phan Trọng Thức", email: "phanthuc115@gmail.com", password: "123456",
    password_confirmation: "123456", role: 0, confirmed_at: Time.now},
  {name: "Phan Trong Thuc", email: "phantrongthuc20@gmail.com", password: "123456",
    password_confirmation: "123456", role: 1, confirmed_at: Time.now},
  {name: "Trọng Thức Phan", email: "ptthuc77@gmail.com", password: "123456",
    password_confirmation: "123456", role: 2, confirmed_at: Time.now}
])
Province.create([
  {name: "Hà Nội", description: Faker::Lorem.paragraph},
  {name: "Đà Nẵng", description: Faker::Lorem.paragraph},
  {name: "Bình Định", description: Faker::Lorem.paragraph},
  {name: "TP. Hồ Chí Minh", description: Faker::Lorem.paragraph}
])
District.create([
  {name: "Quận Hải Châu", description: Faker::Lorem.paragraph, province_id: 2},
  {name: "Quận Cẩm Lệ", description: Faker::Lorem.paragraph, province_id: 2},
  {name: "Quận Thanh Khê", description: Faker::Lorem.paragraph, province_id: 2},
  {name: "Quận Liên Chiểu", description: Faker::Lorem.paragraph, province_id: 2},
  {name: "Quận Ngũ Hành Sơn", description: Faker::Lorem.paragraph, province_id: 2},
  {name: "Quận Sơn Trà", description: Faker::Lorem.paragraph, province_id: 2},
  {name: "Huyện Hòa Vang", description: Faker::Lorem.paragraph, province_id: 2}
])
SubPitchType.create([
  {name: "Sân 5 người chơi", description: Faker::Lorem.paragraph},
  {name: "Sân 7 người chơi", description: Faker::Lorem.paragraph},
  {name: "Sân 9 người chơi", description: Faker::Lorem.paragraph},
  {name: "Sân 11 người chơi", description: Faker::Lorem.paragraph}
])
