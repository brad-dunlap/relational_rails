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

	def restaurant_params
		params.permit(:name, :num_of_employees, :alcohol_served)
	end
end