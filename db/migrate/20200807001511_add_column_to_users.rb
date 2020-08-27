class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname,         :string, null: false
    add_column :users, :family_name,      :string, null: false
    add_column :users, :given_name,       :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :given_name_kana,  :string, null: false
    add_column :users, :birthday,         :date,   null: false
  end
end