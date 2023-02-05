class RestaurantItemsController < ApplicationController
	def index
		@restaurant = Restaurant.find(params[:id])
		@items = @restaurant.items
	end

	def new
		@restaurant = Restaurant.find(params[:id])
	end

	def create
		restaurant = Restaurant.find(params[:id])
		item = restaurant.items.create!(item_params)
		redirect_to "/restaurants/#{restaurant.id}/items"
	end

private
	def item_params
		params.permit(:name, :price, :featured)
	end
end