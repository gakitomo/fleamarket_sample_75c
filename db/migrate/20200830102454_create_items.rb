class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null:false
      t.string :brand
      t.string :condition_id, null: false
      t.string :shipping_burden_id
      t.string :shipping_method_id, null: false
      t.string :shipping_area_id, null: false
      t.string :category_id, null: false
      t.integer :shipping_data, null: false
      t.integer :price, null: false
      t.integer :seller_id
      t.integer :buyer_id
      t.timestamps
    end
  end
end