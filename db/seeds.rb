# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create scores
(0..15).each do |i|
  for j in 0..i do
    Score.find_or_create_by_name("#{i}-#{j}")
    Score.find_or_create_by_name("#{j}-#{i}")
  end
end

# Create users
staffs = ["anvh","anvt","binhnt","chanhlh","chientx","cuonglt","duongdn","hanght","hiennv","hiepnh","hoahm","huongdt","locnpq","locnp","minhha","namtv","nguyenhtt","nhannm","nhannv","sinhnt","thaodth","thaotp","thamdt","thieunv","thuyltt","vietba","vietth", "lienminh_win", "lienminh_thi_dai_hoc", "lienminh_minh_nhan"]
staffs_fullname = ["Võ Hoài An", "Võ Tiến An", "Nguyễn Thanh Bình", "Lê Hoàng Chánh", "Trần Xuân Chiến", "Lâm Thanh Cường", "Đoàn Nguyên Dương", "Hoàng Thị Hằng", "Nguyễn Văn Hiến", "Nguyễn Hoàng Hiệp", "Hoàng Minh Hòa", "Đặng Thị Hưởng", "Nguyễn Phan Quốc Lộc", "Nguyễn Phúc Lộc", "Hỷ A Minh", "Trần Văn Năm", "Hà Thị Thảo Nguyên", "Nguyễn Minh Nhân", "Nguyễn Văn Nhân", "Nguyễn Trường Sinh", "Đinh Thị Hiếu Thảo", "Trần Phước Thảo", "Đỗ Thị Thắm", "Nguyễn Văn Thiệu", "Lê Thị Thanh Thúy", "Bùi Âu Việt", "Trần Hoàng Việt", "Liên Minh Win", "Liên Minh Thi Đại Học", "Liên Minh Minh Nhân"]
admin = User.find_by_email("admin@nustechnology.com")
if !admin
  admin = User.new(email: "admin@nustechnology.com", password: "~!@@!~", password_confirmation: "~!@@!~", admin: true, full_name: "NUS Technology Company")
  admin.save
end
staffs.each_with_index do |staff, index|
  user = User.find_by_email("#{staff}@nustechnology.com")
  if !user
    user = User.new(username: "#{staff}", email: "#{staff}@nustechnology.com", password: "123", password_confirmation: "123", full_name: "#{staffs_fullname[index]}")
    user.save
  end
end