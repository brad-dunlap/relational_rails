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

chutneys = Restaurant.create!(name: "Chutney's Corner Cantina", num_of_employees: 10, alcohol_served: true)
tacos = chutneys.items.create!(name: "Tuna Tacos", price: 9.99, featured: true)
marts = chutneys.items.create!(name: "Catnip Margaritas", price: 7.99, featured: true)

