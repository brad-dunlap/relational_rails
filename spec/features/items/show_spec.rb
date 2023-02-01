require 'rails_helper'

RSpec.describe 'the items show page' do
	it 'displays all of the items in the system' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
		visit "/items"

		expect(page).to have_content(item1.name)
	end
end