require 'rails_helper'

RSpec.describe Restaurant do
	it {should have_many :items}

	it 'displays the number of menu items associated with the restaurant' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
		item2 = restaurant.items.create(name: "Pizza", price: 6.99, featured: true)
		expect(restaurant.item_count).to eq(2)
	end
end