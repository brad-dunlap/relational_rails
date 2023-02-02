class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all.sort_by { |rest| rest.created_at }.reverse
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end
end