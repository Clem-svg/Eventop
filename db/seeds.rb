# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do

  User.create!(
    email: ("filou78@yopmail.com"),
    encrypted_password: "azerty",
    description: Faker::GreekPhilosophers.quote,
    first_name: Faker::GreekPhilosophers.name,
    last_name: Faker::Hipster.word
  )

end


3.times do

  Event.create!(
    start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    duration: [30, 45,60,90,120].sample,
    title: Faker::Food.dish,
    description: Faker::Food.description,
    price: Faker::Number.between(from: 1, to: 1000),
    location: Faker::Address.street_address,
    event_admin: User.all.sample
    )


end

10.times do

  Attendance.create!(
    stripe_customer_id: Faker::Stripe.valid_card,
    user: User.all.sample,
    event: Event.all.sample
  )

end