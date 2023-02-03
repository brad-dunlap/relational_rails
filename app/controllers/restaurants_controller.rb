class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all.sort_by { |rest| rest.created_at }.reverse
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def new 		
	end

	def create 
		restaurant = Restaurant.create!(
			name: params[:name],
			num_of_employees: params[:num_of_employees],
			alcohol_served: params[:alcohol_served]
		)
		redirect_to "/restaurants"
	end
end