require 'rails_helper'

RSpec.describe Item do
	it {should belong_to :restaurant}
	
	it 'returns only featured items' do
		restaurant = Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)
		item1 = restaurant.items.create(name: "Pierogies", price: 6.99, featured: true)
		item2 = restaurant.items.create(name: "Pizza", price: 6.99, featured: false)
		item3 = restaurant.items.create(name: "Burger", price: 6.99, featured: true)
	
		featured_items = Item.is_featured
	
		expect(featured_items.count).to eq(2)
		expect(featured_items).to eq([item1, item3])
	end
end