2.times do |i|
  User.create(name: Faker::Name.name, email: "example#{i + 1}@gmail.com", password: "123456",
    password_confirmation: "123456", role: 0, confirmed_at: Time.now)
end
10.times do |i|
  User.create(name: Faker::Name.name, email: "example#{3 + i}@gmail.com", password: "123456",
    password_confirmation: "123456", role: 1, confirmed_at: Time.now)
end
10.times do |i|
  User.create(name: Faker::Name.name, email: "example#{13 + i}@gmail.com", password: "123456",
    password_confirmation: "123456", role: 2, confirmed_at: Time.now)
end
puts "Created user"
500.times{Province.create(name: Faker::Address.city, description: Faker::Lorem.paragraph)}
Province.where("name = ?", "Hà Tây").update name: "Hà Nội"
Province.where("name = ?", "TP Hải Phòng").update name: "Hải Phòng"
Province.where("name = ?", "TP Đà Nẵng").update name: "Đà Nẵng"
Province.where("name = ?", "TP TP. Hồ Chí Minh").update name: "TP Hồ Chí Minh"
Province.where("name = ?", "TP Cần Thơ").update name: "Cần Thơ"
puts "Created province"
hn = Province.find_by(name: "Hà Nội").id
hp = Province.find_by(name: "Hải Phòng").id
dn = Province.find_by(name: "Đà Nẵng").id
bd = Province.find_by(name: "Bình Định").id
hcm = Province.find_by(name: "TP Hồ Chí Minh").id
ct = Province.find_by(name: "Cần Thơ").id
District.create!([
  {name: "Quận Ba Đình", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Hoàn Kiếm", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Tây Hồ", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Long Biên", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Cầu Giấy", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Đống Đa", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Hai Bà Trưng", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Hoàng Mai", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Thanh Xuân", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Sóc Sơn", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Đông Anh", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Gia Lâm", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Nam Từ Liêm", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Thanh Trì", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Bắc Từ Liêm", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Mê Linh", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Hà Đông", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Thị xã Sơn Tây", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Ba Vì", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Phúc Thọ", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Đan Phượng", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Hoài Đức", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Quốc Oai", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Thạch Thất", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Chương Mỹ", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Thanh Oai", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Thường Tín", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Phú Xuyên", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Ứng Hòa", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Huyện Mỹ Đức", description: Faker::Lorem.paragraph, province_id: hn},
  {name: "Quận Dương Kinh", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Quận Đồ Sơn", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Quận Hải An", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Quận Hồng Bàng", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Quận Kiến An", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Quận Lê Chân", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Quận Ngô Quyền", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Huyện An Dương", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Huyện An Lão", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Huyện đảo Bạch Long Vĩ", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Huyện đảo Cát Hải", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Huyện Kiến Thụy", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Huyện Tiên Lãng", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Huyện Thủy Nguyên", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Huyện Vĩnh Bảo", description: Faker::Lorem.paragraph, province_id: hp},
  {name: "Quận Hải Châu", description: Faker::Lorem.paragraph, province_id: dn},
  {name: "Quận Cẩm Lệ", description: Faker::Lorem.paragraph, province_id: dn},
  {name: "Quận Thanh Khê", description: Faker::Lorem.paragraph, province_id: dn},
  {name: "Quận Liên Chiểu", description: Faker::Lorem.paragraph, province_id: dn},
  {name: "Quận Ngũ Hành Sơn", description: Faker::Lorem.paragraph, province_id: dn},
  {name: "Quận Sơn Trà", description: Faker::Lorem.paragraph, province_id: dn},
  {name: "Huyện Hòa Vang", description: Faker::Lorem.paragraph, province_id: dn},
  {name: "Huyện Hòa Vang", description: Faker::Lorem.paragraph, province_id: dn},
  {name: "TP. Quy Nhơn", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Huyện Tuy Phước", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Thị xã An Nhơn", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Huyện Phù Cát", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Huyện Phù Mỹ", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Huyện Hoài Nhơn", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Huyện An Lão", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Huyện Hoài Ân", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Huyện Vân Canh", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Huyện Tây Sơn", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Huyện Vĩnh Thạnh", description: Faker::Lorem.paragraph, province_id: bd},
  {name: "Quận 1", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 12", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận Thủ Đức", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 9", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận Gò Vấp", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận Bình Thạnh", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận Tân Bình", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận Tân Phú", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận Phú Nhuận", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 2", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 3", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 10", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 11", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 4", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 5", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 5", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 8", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận Bình Tân", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận 7", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Huyện Củ Chi", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Huyện Hóc Môn", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Huyện Bình Chánh", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Huyện Nhà Bè", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Huyện Cần Giờ", description: Faker::Lorem.paragraph, province_id: hcm},
  {name: "Quận Bình Thủy", description: Faker::Lorem.paragraph, province_id: ct},
  {name: "Quận Cái Răng", description: Faker::Lorem.paragraph, province_id: ct},
  {name: "Quận Ô Môn", description: Faker::Lorem.paragraph, province_id: ct},
  {name: "Huyện Cờ Đỏ", description: Faker::Lorem.paragraph, province_id: ct},
  {name: "Huyện Phong Điền", description: Faker::Lorem.paragraph, province_id: ct},
  {name: "Huyện Thới Lai", description: Faker::Lorem.paragraph, province_id: ct},
  {name: "Huyện Vĩnh Thạnh", description: Faker::Lorem.paragraph, province_id: ct}
])
Province.where.not(id: [hn, hp, dn, bd, hcm, ct]).pluck(:id).each do |province_id|
  15.times do
    District.create(name: Faker::Address.street_name, description: Faker::Lorem.paragraph, province_id: province_id)
  end
end
puts "Created district"
SubPitchType.create([
  {name: "Sân 05 người", description: Faker::Lorem.paragraph},
  {name: "Sân 07 người", description: Faker::Lorem.paragraph},
  {name: "Sân 09 người", description: Faker::Lorem.paragraph},
  {name: "Sân 11 người", description: Faker::Lorem.paragraph}
])
puts "Created sub pitch type"
Level.create([
  {name: "Mới tập chơi", description: Faker::Lorem.paragraph},
  {name: "Mềm", description: Faker::Lorem.paragraph},
  {name: "Trung bình", description: Faker::Lorem.paragraph},
  {name: "Mạnh", description: Faker::Lorem.paragraph}
])
puts "Created level"
[hn, hp, dn, bd, hcm, ct].each do |province_id|
  District.where("province_id = ?", province_id).pluck(:id).each do |district_id|
    Pitch.create!(name: "Sân bóng #{Faker::Name.name}", phone_number: "0123456789", active: true,
      open_at: "04:00", close_at: "22:00", email: "example@gmail.com", description: Faker::Lorem.paragraph,
      address: Faker::Address.street_address, user_id: Faker::Number.between(from: 3, to: 12),
      province_id: province_id, district_id: district_id)
  end
end
puts "Created pitch"
type_names = SubPitchType.pluck :name
Pitch.pluck(:id).each do |pitch_id|
  type_id = Faker::Number.between(from: 1, to: 4)
  SubPitch.create(name: type_names[type_id - 1], description: Faker::Lorem.paragraph,
    active: true, pitch_id: pitch_id, sub_pitch_type_id: type_id)
end
puts "Created sub pitch"
SubPitch.pluck(:id).each do |sub_pitch_id|
  Timesheet.create(start_at: "05:00", end_at: "06:00",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
  Timesheet.create(start_at: "6:10", end_at: "07:10",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
  Timesheet.create(start_at: "07:20", end_at: "08:20",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
  Timesheet.create(start_at: "08:30", end_at: "09:30",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
  Timesheet.create(start_at: "15:00", end_at: "16:00",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
  Timesheet.create(start_at: "16:10", end_at: "17:10",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
  Timesheet.create(start_at: "17:20", end_at: "18:20",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
  Timesheet.create(start_at: "18:30", end_at: "19:30",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
  Timesheet.create(start_at: "19:40", end_at: "20:40",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
  Timesheet.create(start_at: "20:50", end_at: "21:50",
    price: Faker::Number.number(digits: 6), sub_pitch_id: sub_pitch_id)
end
puts "Created timesheet"
User.pluck(:id).each do |user_id|
  member = []
  10.times do
    member.push Faker::Number.between(from: 1, to: 22)
  end
  Team.create(name: Faker::Name.name, member: member, user_id: user_id,
    level_id: Faker::Number.between(from: 1, to: 4), province_id: [hn, hp, dn, bd, hcm, ct].sample,
    district_id: Faker::Number.between(from: 1, to: 95), pitch_id: Faker::Number.between(from: 1, to: 95))
end
puts "Created team"
User.pluck(:id).each do |user_id|
  Match.create(time: (Time.now + 5.days), team_id: Faker::Number.between(from: 1, to: 23), user_id: user_id,
    level_id: Faker::Number.between(from: 1, to: 4), province_id: [hn, hp, dn, bd, hcm, ct].sample,
    district_id: Faker::Number.between(from: 1, to: 95), pitch_id: Faker::Number.between(from: 1, to: 95),
    betting: Faker::Lorem.paragraph, invition: Faker::Lorem.paragraph, captain_name: Faker::Name.name)
end
puts "Created match"
