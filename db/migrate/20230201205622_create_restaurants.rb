class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :num_of_employees
      t.boolean :alcohol_served
			t.timestamps
    end
  end
end
