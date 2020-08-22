class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.string :brand
      t.integer :condition_id
      t.integer :shipping_burden_id
      t.integer :shipping_method_id
      t.integer :shipping_area_id
      t.integer :shipping_date
      t.integer :price
      t.integer :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
