require 'rails_helper'

RSpec.describe 'the restaurants show page' do
	describe 'show page' do
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

	describe 'the restaurant edit' do
		it 'links to the edit restaurant page' do
			restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
			visit "restaurants/#{restaurant.id}"
			click_link "Edit #{restaurant.name}"
			expect(current_path).to eq("/restaurants/#{restaurant.id}/edit")
		end
	end

	describe 'the restaurant delete' do
		it 'can delete a restaurant' do
			restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
			visit "restaurants/#{restaurant.id}"
			click_link "Delete #{restaurant.name}"
			expect(current_path).to eq("/restaurants")
			expect(page).to have_no_content(restaurant.name)
		end
	end
end	
