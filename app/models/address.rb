class Address < ApplicationRecord
  validates :address_last_name, format: { with: /\A[一-龥ぁ-ん]/ }, allow_blank: true
  validates :address_last_name, presence: true
  validates :address_first_name, format: { with: /\A[一-龥ぁ-ん]/ }, allow_blank: true
  validates :address_first_name, presence: true
  validates :address_last_name_kana, format: { with: /\A[ぁ-んー－]+\z/}, allow_blank: true
  validates :address_last_name_kana, presence: true
  validates :address_first_name_kana, format: { with: /\A[ぁ-んー－]+\z/}, allow_blank: true
  validates :address_first_name_kana, presence: true
  validates :address_number, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/}, allow_blank: true
  validates :address_number, presence: true
  validates :address_prefecture, presence: true
  validates :address_name, presence: true
  validates :address_block, presence: true
  validates :address_building, presence: true, allow_blank: true
  validates :address_phone_number, presence: true, allow_blank: true

  belongs_to :user, optional: true
end
