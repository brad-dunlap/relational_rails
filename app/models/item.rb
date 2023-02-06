class Item <ApplicationRecord
	belongs_to :restaurant

	scope :is_featured, -> { where("featured") }
	scope :sort_alphabetically, -> { order(:name) }
end