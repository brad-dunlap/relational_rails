class RestaurantItemsController < ApplicationController
	def index
		@restaurant = Restaurant.find(params[:id])
		@items = @restaurant.items
	end
end