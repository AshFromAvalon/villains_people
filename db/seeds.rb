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


Order.destroy_all if Rails.env.development?
Crime.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

puts"create villains"

#add url pic
dalton_pic = URI.open('https://i.ytimg.com/vi/u2xWnpl_Rzg/maxresdefault.jpg')

dalton = User.new(email: "daltons@daltons.con", password:"123456", user_name: "The Daltons", alias: "The Daltons", description: "Best thieves in town", rating: 3)
dalton.photo.attach(io: dalton_pic, filename: 'daltons.jpg', content_type: 'image/jpg')
dalton.save!

#Add your villain by change params of User.new bellow
# YOUR_VILLAIN = User.new(email: "YOUR_VILLAIN@YOUR_VILLAIN.con", password:"123456", user_name: "YOUR_VILLAIN USER NAME", alias: "YOUR_VILLAIN ALIAS", description: "YOUR_VILLAIN DESCRIPTION")
# YOUR_VILLAIN.photo.attach(io: YOUR_VILLAIN_pic, filename: 'YOUR_VILLAINs.jpg', content_type: 'image/jpg')
# YOUR_VILLAIN.save

puts "create regular users"

max = User.new(email: "max@max.con", password:"123456", user_name: "Amazing Max")
max.save

puts"create villain crimes"

dalton_crime = Crime.create!(user_id: dalton.id, name: "bank robbery", category: "Thief", price: 10, currency: "dogs" )
#Add your villain crimes by changing params bellow
# YOUR_VILLAIN_crime = Crime.create!(user_id: YOUR_VILLAIN.id, name: "bank robbery", category: "Thief", price: "10", currency: "dogs" )

puts "create regular users orders"

max_order = Order.new(user_id: max.id, crime_id: dalton_crime.id, description: "Please help me to steal my sister's toys !")
