class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :address_first_name,        null: false
      t.string     :address_last_name,         null: false
      t.string     :address_first_name_kana,   null: false
      t.string     :address_last_name_kana,    null: false
      t.string     :address_number,            null: false
      t.string     :address_prefecture,        null: false
      t.string     :address_name,              null: false
      t.string     :address_block,             null: false
      t.string     :address_building
      t.string     :address_phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
