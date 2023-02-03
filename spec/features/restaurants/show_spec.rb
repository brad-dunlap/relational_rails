require 'rails_helper'

RSpec.describe 'the restaurants show page' do
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

	it 'displays the restaurant name' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		visit "restaurants/#{restaurant.id}"
		expect(page).to have_content(restaurant.name)
		expect(page).to have_content(restaurant.num_of_employees)
		expect(page).to have_content(restaurant.alcohol_served)
	end

	it 'displays the number of employees' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		visit "restaurants/#{restaurant.id}"
		expect(page).to have_content(restaurant.num_of_employees)
	end

	it 'displays if alcohol is served' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		visit "restaurants/#{restaurant.id}"
		expect(page).to have_content(restaurant.alcohol_served)
	end

	it 'displays the number of menu items associated with the restaurant' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
		visit "restaurants/#{restaurant.id}"
		expect(page).to have_content(restaurant.items.count)
	end

	it 'displays a link to the restaurants menu items' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		visit "restaurants/#{restaurant.id}"
		expect(page).to have_link("View Menu Items")
	end
end