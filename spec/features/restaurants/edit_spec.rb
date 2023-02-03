require 'rails_helper'

RSpec.describe 'the restaurant edit' do
	it 'links to the edit restaurant page' do
		restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
		visit '/restaurants'
		click_button "Edit #{restaurant.name}"
		expect(current_path).to eq("/restaurants/#{restaurant.id}/edit")
	end

	it 'can edit the restaurant' do
		restaurant = Restaurant.create!(name: 'The Restaurant', num_of_employees: 1, alcohol_served: false)
		visit '/restaurants'
		click_button "Edit #{restaurant.name}"

		fill_in 'Name', with: 'The Other Restaurant'
		click_button 'Update Restaurant'

		expect(current_path).to eq("/restaurants")
		expect(page).to have_content('The Other Restaurant')
	end
end