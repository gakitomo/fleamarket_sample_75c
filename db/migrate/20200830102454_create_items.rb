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
      t.integer :shipping_data_id, null: false
      t.integer :price, null: false
      t.references :seller, foreign_key: {to_table: :users} 
      t.references :buyer, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end