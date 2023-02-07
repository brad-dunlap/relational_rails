require 'rails_helper'

RSpec.describe 'shows items by restaurant' do	
	let!(:restaurant){Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)}
	let!(:item){restaurant.items.create!(name: "Pierogies", price: 6.99, featured: true)}

		describe 'restaurant menu items index page' do
			it 'can how all the items a restaurant has' do	
				visit "/restaurants/#{restaurant.id}/items"
				expect(page).to have_content(item.name)
		end
			it 'has a link to all restaurants at the top of the page' do	
				visit "/restaurants/#{restaurant.id}/items"
				expect(page).to have_link("All Restaurants")
		end
	end

	describe 'sorts alphabetically' do
		it 'can sort items alphabetically' do
			restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
			item1 = restaurant.items.create!(name: "Pizza", price: 6.99, featured: true)
			item2 = restaurant.items.create!(name: "Apples", price: 6.99, featured: true)
			visit "restaurants/#{restaurant.id}/items"

			click_on "Sort Alphabetically"

			expect(item2.name).to appear_before(item1.name)
		end
	end

	describe 'the menu item edit' do
		it 'links to the edit menu item page on each item' do
			restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
			item1 = restaurant.items.create!(name: "Pierogies", price: 6.99, featured: true)
			visit "/restaurants/#{restaurant.id}/items"
			click_link "Edit #{item1.name}"
			expect(current_path).to eq("/items/#{item1.id}/edit")
		end
	end
end