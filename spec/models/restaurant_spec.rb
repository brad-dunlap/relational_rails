require 'rails_helper'

RSpec.describe Restaurant do
	it {should have_many :items}
end