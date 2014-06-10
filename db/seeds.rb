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
    Score.find_or_create_by_name("#{i} - #{j}")
  end
end

# Create users
admin = User.find_by_email("admin@example.com")
if !admin
  admin = User.new(email: "admin@example.com", password: "1234567890", password_confirmation: "1234567890", admin: true)
  admin.save
end
for i in 1..20 do
  user = User.find_by_email("user#{i}@example.com")
  if !user
    user = User.new(email: "user#{i}@example.com", password: "12345678", password_confirmation: "12345678")
    user.save
  end
end

# Create total_money for all matches
Game.order(:id).map(&:id).each do |game_id|
  Investment.find_or_create_by_game_id(game_id)
end