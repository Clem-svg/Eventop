# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'time'

#create random users
10.times do
  User.create!(email: Faker::Name.first_name+Faker::Name.last_name+"@yopmail.com",
  encrypted_password: ["yellow", "coucou", "marseille", "password", "supersuper"].sample,
  description: Faker::TvShows::Community.quotes,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name)
end
puts "*" * 20
puts "USERS"
puts tp User.all

#create random events
10.times do

  Event.create!(
  start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
  duration: [15, 30, 45, 60, 90].sample,
  title: ["Pikachu", "Bulbizar", "Salameche", "Carapuce", "Roucoul", "Ratata", "Chenipan"].sample,
  description: "Mon métier est "+Faker::Job.title+"et mon film préféré est"+Faker::Movie.title,
  price: Faker::Number.between(from: 1, to: 1000),
  location: ["Mendoza", "Bariloche", "El Calafate", "Buenos Aires", "Salta", "Cordoba", "Rosario", "El Chalten"].sample,
  event_admin: User.all.sample)
end
puts "*" * 20
puts "EVENTS"
puts tp Event.all