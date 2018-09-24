class CreateProductSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :product_searches do |t|
      t.string :asin
      t.integer :counter

      t.timestamps
    end
    add_index 'product_searches', :asin, unique: true
    add_index 'product_searches', :counter
  end
end
