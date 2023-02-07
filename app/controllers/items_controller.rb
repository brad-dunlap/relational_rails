class ItemsController < ApplicationController
	def index
		@items = Item.is_featured
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit 
		@item = Item.find(params[:id])	
	end

	def update 
		item = Item.find(params[:id])
		item.update!(item_params)
		redirect_to "/items/#{item.id}"
	end

	def destroy
		item = Item.find(params[:id])
		item.destroy
		flash[:notice] = "Item was successfully deleted."
		
		redirect_to items_path
	end

private
	def item_params
		params.permit(:name, :price, :featured)
	end
end