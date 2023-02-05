require 'rails_helper'

RSpec.describe 'shows items by restaurant' do
	it 'links to the new page from the restaurants items index page' do
		restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)

		visit "/restaurants/#{restaurant.id}/items"

		click_link('New Menu Item')
		expect(current_path).to eq("/restaurants/#{restaurant.id}/items/new")
	end

	it 'can create a new item' do
		restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)

		visit "/restaurants/#{restaurant.id}/items/new"

		fill_in('Name', with: 'Salmon Roll')
		fill_in('Price', with: 9.99)
		find('#featured').click
		click_button("Create Menu Item")

		expect(current_path).to eq("/restaurants/#{restaurant.id}/items")
		expect(page).to have_content('Salmon Roll')
	end
end