class Address < ApplicationRecord
  validates :address_last_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :address_first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :address_last_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/}
  validates :address_first_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/}
  validates :address_number, presence: true, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/}
  validates :address_prefecture, presence: true
  validates :address_name, presence: true
  validates :address_block, presence: true
  validates :address_building, format: { with: /\A([a-z]+|)\z/i }, :allow_blank => true
  validates :address_phone_number, format: { with: /\A\d{10,11}\z/ }, :allow_blank => true

  belongs_to :user, optional: true
end
