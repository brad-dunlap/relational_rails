require 'rails_helper'

RSpec.describe 'the menu item edit' do
	it 'links to the edit item page' do
		restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
		item = restaurant.items.create!(name: 'The Sandwich', price: 10.99, featured: false)
		visit "/items/#{item.id}"
		click_link "Edit #{item.name}"
		expect(current_path).to eq("/items/#{item.id}/edit")
	end

	it 'can edit the item' do
		restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
		item = restaurant.items.create!(name: 'The Sandwich', price: 10.99, featured: false)
		visit "/items/#{item.id}"
		click_link "Edit #{item.name}"

		fill_in 'Name', with: 'The NEW Sandwich'
		click_button 'Update Item'

		expect(current_path).to eq("/items/#{item.id}")
		expect(page).to have_content('The NEW Sandwich')
	end
end