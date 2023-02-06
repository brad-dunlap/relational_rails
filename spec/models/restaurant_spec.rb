require 'rails_helper'

RSpec.describe Restaurant do
	it {should have_many :items}

	it 'displays restaurants in descending order by created_by' do
		restaurant1 = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		restaurant2 = Restaurant.create!(name: "Dans", num_of_employees: 2, alcohol_served: true)
		
		restaurants = Restaurant.by_recently_created

		expect(restaurants.first).to eq(restaurant2)
    expect(restaurants.second).to eq(restaurant1)
	end

	it 'displays the number of menu items associated with the restaurant' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
		item2 = restaurant.items.create(name: "Pizza", price: 6.99, featured: true)
		
		expect(restaurant.item_count).to eq(2)
	end
end