require 'rails_helper'

RSpec.describe 'shows items by restaurant' do
	
		let!(:restaurant){Restaurant.create!(name: "Brads", num_of_employees: 2, alcohol_served: true)}
		let!(:item){restaurant.items.create!(name: "Pierogies", price: 6.99, featured: true)}
		
		it 'can how all the items a restaurant has' do	
			visit "/restaurants/#{restaurant.id}/items"
			expect(page).to have_content(item.name)
	end
		it 'has a link to all restaurants at the top of the page' do	
			visit "/restaurants/#{restaurant.id}/items"
			expect(page).to have_link("All Restaurants")
	end
end