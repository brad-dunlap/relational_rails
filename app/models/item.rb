class Item <ApplicationRecord
	belongs_to :restaurant

	scope :is_featured, -> { where("featured") }
end