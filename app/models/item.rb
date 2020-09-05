class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :shipping_method
  belongs_to user, foreign_key: 'user_id'
end
