# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# x = 1

# 10.times do
#   name = "michel" + x.to_s
#   x += 1
#   email = name + "@michel.com"
#   User.create!(user_name: name, email: email, password: "azerty")
# end
require 'open-uri'
#users

puts"create users"

Order.destroy_all if Rails.env.development?
Crime.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?


dalton_pic = URI.open('https://i.ytimg.com/vi/u2xWnpl_Rzg/maxresdefault.jpg')

dalton = User.new(email: "daltons@daltons.con", password:"123456", user_name: "The Daltons", alias: "The Daltons", description: "Best thieves in town")
dalton.photo.attach(io: dalton_pic, filename: 'daltons.jpg', content_type: 'image/jpg')
dalton.save


puts"create crimes"

dalton_crime = Crime.create!(user_id: dalton.id, name: "bank robbery", category: "Thief", price: "10", currency: "dogs" )
