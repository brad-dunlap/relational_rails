require 'rails_helper'

RSpec.describe 'the items show page' do
	describe 'show page attributes' do
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

	describe 'the child delete' do
		it 'can delete a menu item' do
			restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
			item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)

			visit "items/#{item1.id}"
			click_link "Delete #{item1.name}"

			expect(current_path).to eq("/items")
			expect(page).to have_no_content(item1.name)
		end
	end
end	