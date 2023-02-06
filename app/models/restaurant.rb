class Restaurant < ApplicationRecord
	has_many :items

	def item_count
		self.items.count
	end
end