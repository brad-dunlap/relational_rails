ActiveRecord::Schema.define(version: 2023_02_01_215351) do
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "featured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_items_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.integer "num_of_employees"
    t.boolean "alcohol_served"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "restaurants"
end
