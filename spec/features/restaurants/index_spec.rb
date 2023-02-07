require 'rails_helper'

RSpec.describe 'the restaurants index page' do
	describe 'index page attributes' do
		it 'displays all of the restaurants in the system' do
			restaurant1 = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
			restaurant2 = Restaurant.create!(name: "Dans", num_of_employees: 2, alcohol_served: true)
			visit "/restaurants"

			expect(page).to have_content(restaurant1.name)
			expect(page).to have_content(restaurant2.name)
		end

		it 'displays restaurants in descending order by created_by' do
			restaurant1 = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
			restaurant2 = Restaurant.create!(name: "Dans", num_of_employees: 2, alcohol_served: true)
			visit "/restaurants"
			
			expect(restaurant2.name).to appear_before(restaurant1.name)
		end

		it 'links to the edit restaurant page' do
			restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
			visit '/restaurants'
			click_link "Edit #{restaurant.name}"
			expect(current_path).to eq("/restaurants/#{restaurant.id}/edit")
		end
	end

	describe 'the restaurant delete' do
		it 'can delete a restaurant from the restaurant index page' do
			restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
			visit "/restaurants"
			click_link "Delete #{restaurant.name}"
			expect(current_path).to eq("/restaurants")
			expect(page).to have_no_content(restaurant.name)
		end
	end
end	