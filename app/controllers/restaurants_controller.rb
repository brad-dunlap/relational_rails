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
		restaurant = Restaurant.create!(restaurant_params)
		
		redirect_to "/restaurants"
	end
	
	def edit
		@restaurant = Restaurant.find(params[:id])
	end
	
	def update
		restaurant = Restaurant.find(params[:id])
		restaurant.update(restaurant_params)
		redirect_to '/restaurants'
	end

private
	def restaurant_params
		params.permit(:name, :num_of_employees, :alcohol_served)
	end
end