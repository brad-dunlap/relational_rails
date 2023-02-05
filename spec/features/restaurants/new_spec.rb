require 'rails_helper'

RSpec.describe 'the Restaurant creation' do
	it 'links to the new page from the restaurants index page' do
		visit '/restaurants'

		click_link('New Restaurant')
		expect(current_path).to eq('/restaurants/new')
	end

	it 'can create a new restaurant' do
		visit '/restaurants/new'

		fill_in('Name', with: 'Super Sushi')
		fill_in('Number of Employees', with: 8)
		find('#alcohol_served').click
		click_button("Create Restaurant")

		expect(current_path).to eq("/restaurants")
		expect(page).to have_content('Super Sushi')
	end
end