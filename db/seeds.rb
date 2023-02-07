# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brads = Restaurant.create!(name: "Brad's Bar", num_of_employees: 12, alcohol_served: true)
pierogies = brads.items.create!(name: "Pierogies", price: 6.99, featured: true)
sammich = brads.items.create!(name: "The Sammich", price: 12.99, featured: true)
haluski = brads.items.create!(name: "Haluski", price: 10.99, featured: false)
beer = brads.items.create!(name: "Iron City", price: 5.99, featured: true)

chutneys = Restaurant.create!(name: "Chutney's Corner Cantina", num_of_employees: 10, alcohol_served: true)
tacos = chutneys.items.create!(name: "Tuna Tacos", price: 9.99, featured: true)
margs = chutneys.items.create!(name: "Catnip Margaritas", price: 7.99, featured: false)
salmon = chutneys.items.create!(name: "Salmon Filet", price: 13.99, featured: true)
treats = chutneys.items.create!(name: "They're Seriously Just Cat Treats", price: 5.99, featured: false)

corner = Restaurant.create!(name: "Corner Kafe", num_of_employees: 5, alcohol_served: true)
mimosa = corner.items.create!(name: "All You Can Drink Mimosas", price: 20, featured: true)
biscuit = corner.items.create!(name: "Chicken Biscuit", price: 15.50, featured: true)
donuts = corner.items.create!(name: "Donuts", price: 5.50, featured: true)
