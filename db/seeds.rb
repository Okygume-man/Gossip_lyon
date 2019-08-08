# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'table_print'

User.destroy_all
Gossip.destroy_all
City.destroy_all

10.times do
	City.create(name: Faker::Nation.capital_city)
end
puts "J'ai crées 10 villes"

25.times do 
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: rand(City.first.id..City.last.id), email: Faker::Internet.email, age: rand(18..70), description: Faker::Lorem.paragraphs)
end

puts "J'ai crées 25 utilisateurs"

25.times do 
	Gossip.create(user_id: rand(User.first.id..User.last.id), title: Faker::Esport.player, content: Faker::ChuckNorris.fact)
end

puts "J'ai crées 25 gossips"


