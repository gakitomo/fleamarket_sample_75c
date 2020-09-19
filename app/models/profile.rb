class Profile < ApplicationRecord
  validates :family_name, format: { with: /\A[一-龥ぁ-ん]/ }, allow_blank: true
  validates :family_name, presence: true
  validates :given_name, format: { with: /\A[一-龥ぁ-ん]/ }, allow_blank: true
  validates :given_name, presence: true
  validates :family_name_kana, format: { with: /\A[ぁ-んー－]+\z/}, allow_blank: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, format: { with: /\A[ぁ-んー－]+\z/}, allow_blank: true
  validates :given_name_kana, presence: true
  validates :birthday, presence: true

  belongs_to :user, optional: true
end
