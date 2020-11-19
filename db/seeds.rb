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
require 'nokogiri'
#users

# Order.destroy_all if Rails.env.development?
# Crime.destroy_all if Rails.env.development?
# User.destroy_all if Rails.env.development?

# puts"create villains"

# #add url pic
# dalton_pic = URI.open('https://i.ytimg.com/vi/u2xWnpl_Rzg/maxresdefault.jpg')
# jafar_pic = URI.open('https://static.wikia.nocookie.net/lemondededisney/images/5/56/Jafar.png/revision/latest?cb=20120726102436&path-prefix=fr')


# dalton = User.new(email: "daltons@daltons.con", password:"123456", user_name: "The Daltons", alias: "The Daltons",job_title: "roberers" description: "Best thieves in town", rating: 3)
# dalton.photo.attach(io: dalton_pic, filename: 'daltons.jpg', content_type: 'image/jpg')
# dalton.save!

# jafar = User.new(email: "jafar@jafar.con", password:"123456", user_name: "Jafar", alias: "Most ", description: "Best thieves in town", rating: 3)
# jafar.photo.attach(io: jafar_pic, filename: 'jafars.jpg', content_type: 'image/jpg')
# jafar.save!

# #Add your villain by change params of User.new bellow
# # YOUR_VILLAIN = User.new(email: "YOUR_VILLAIN@YOUR_VILLAIN.con", password:"123456", user_name: "YOUR_VILLAIN USER NAME", alias: "YOUR_VILLAIN ALIAS", description: "YOUR_VILLAIN DESCRIPTION")
# # YOUR_VILLAIN.photo.attach(io: YOUR_VILLAIN_pic, filename: 'YOUR_VILLAINs.jpg', content_type: 'image/jpg')
# # YOUR_VILLAIN.save

# puts "create regular users"

# max = User.new(email: "max@max.con", password:"123456", user_name: "Amazing Max")
# max.save

# puts"create villain crimes"

# dalton_crime = Crime.create!(user_id: dalton.id, name: "bank robbery", category: "Thief", price: 10, currency: "dogs" )
# #Add your villain crimes by changing params bellow
# # YOUR_VILLAIN_crime = Crime.create!(user_id: YOUR_VILLAIN.id, name: "bank robbery", category: "Thief", price: "10", currency: "dogs" )

# puts "create regular users orders"

# max_order = Order.new(user_id: max.id, crime_id: dalton_crime.id, description: "Please help me to steal my sister's toys !")


villains = ["Darth_Vader"]
# puts "villains:"
# puts "picture URL"
# puts "user_name"
# puts "email"
# puts "password"
# puts "Alias"
# puts "job_title"
# puts "description"
# puts "rating"

# puts "crimes"
# puts "user_id"
# puts "crime name"
# puts "category"
# puts "price"
# puts "currency"

elements = []

villains.each do |villain|
  url = "https://villains.fandom.com/wiki/#{villain}"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.pi-image-thumbnail').each do |element|
    puts "photo URL : #{element.attribute('src').value}"
  end
    puts "email : #{villain}@villains.com"
    puts "password : 123456"
  html_doc.search('.portable-infobox > div > div').each do |element|
    puts element
    elements << element
  end
    puts "user_name : #{elements[0]} "
    puts "Alias : #{elements[1].split(/(\w*\s?\w*[a-z])([A-Z]\w*\s?\w*)/)[1]}"
    puts "job_title : #{elements[3].split(/(\w*\s?\w*[a-z])([A-Z]\w*\s?\w*)/)[1]}"
    puts "description : "
  puts "rating : #{rand(0..5)}"
  p elements
end
#mw-content-text > div > aside > div:nth-child(4) > div > div > p




