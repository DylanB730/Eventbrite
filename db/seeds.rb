# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
events = []
attendances = []

for i in 0..6 do
  u = User.create(email: "mat#{i}@yopmail.com" ,
                  encrypted_password: "mdptest" ,
                  description: "rien a dire ici" ,
                  first_name: Faker::Name.first_name, 
                  last_name: Faker::Name.last_name)

  users << u
end

for i in 0..10 do
  admin = User.find(rand(1..User.count))

  e = Event.create(start_date: Faker::Date.forward(days: 60),
                   duration: 180,
                   title: "Title#{i}",
                   description: "Ceci est un evenement avec une description pas tres originale",
                   price: rand(1..1000),
                   location:Faker::Address.city,
                   admin: admin)

  events << e
end

3.times do
  guest = User.find(rand(1..User.count))
  event = Event.find(rand(1..Event.count))

  a = Attendance.create(stripe_customer_id: Faker::Barcode.ean(13),
                        guest: guest,
                        event: event)
                        
  attendances << a
end
