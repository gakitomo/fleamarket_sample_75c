class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname,         :string, null: false, after: :id
  end
end