require 'rails_helper'

RSpec.describe 'the items index page' do
	describe 'index page' do
		it 'displays all of the items in the system' do
			restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
			item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
			visit "/items"

			expect(page).to have_content(item1.name)
		end

		it 'displays only items that are featured' do
			restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
			item1 = restaurant.items.create!(name: "Pierogies", price: 6.99, featured: true)
			item2 = restaurant.items.create!(name: "Pizza", price: 6.99, featured: false)
			visit "/items"
			expect(page).to have_content(item1.name)
			expect(page).to have_no_content(item2.name)
		end
	end

	describe 'the menu item edit' do
		it 'links to the edit menu item page on each item' do
			restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
			item1 = restaurant.items.create!(name: "Paprikash", price: 6.99, featured: true)
			visit "/items"

			click_link "Edit #{item1.name}"

			expect(current_path).to eq("/items/#{item1.id}/edit")
		end
	end

	describe 'the item delete' do
		it 'can delete an item from the child index page' do
			restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
			item1 = restaurant.items.create!(name: "Paprikash", price: 6.99, featured: true)

			visit "/items"
			click_link "Delete #{item1.name}"
			expect(current_path).to eq("/items")
			expect(page).to have_no_content(item1.name)
		end
	end	
end