require 'rails_helper'

RSpec.describe 'the restaurants show page' do
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)
	it 'displays the restaurant name' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		visit "restaurants/#{@restaurant.id}"
		expect(page).to have_content(restaurant.name)
		expect(page).to have_content(restaurant.num_of_employees)
		expect(page).to have_content(restaurant.alcohol_served)
	end

	it 'displays the number of employees' 

	it 'displays if alcohol is served'
end