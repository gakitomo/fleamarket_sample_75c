class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  validates :condition, presence: true
  belongs_to_active_hash :shipping_area
  validates :shipping_area, presence: true
  belongs_to_active_hash :shipping_burden
  validates :shipping_burden, presence: true
  belongs_to_active_hash :shipping_method

  validates :shipping_method, presence: true
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images,allow_destroy: true
  belongs_to :seller,class_name: "User",foreign_key: "seller_id",optional: true
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id",optional: true

  validates :name,presence: true, length:{maximum: 6}
end
