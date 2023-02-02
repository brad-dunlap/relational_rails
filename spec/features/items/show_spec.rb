require 'rails_helper'

RSpec.describe 'the items show page' do
	it 'displays all of the items in the system' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
		visit "/items"

		expect(page).to have_content(item1.name)
	end

	it 'displays the restaurant name' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
		visit "items/#{item1.id}"
		expect(page).to have_content(item1.name)
	end

	it 'displays the item price' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
		visit "items/#{item1.id}"
		expect(page).to have_content(item1.price)
	end

	it 'displays if item is featured' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
		visit "items/#{item1.id}"
		expect(page).to have_content(item1.featured)
	end
end