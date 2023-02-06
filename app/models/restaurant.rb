class Restaurant < ApplicationRecord
	has_many :items

	scope :by_recently_created, -> { order(created_at: :desc) }

	def item_count
		self.items.count
	end

end