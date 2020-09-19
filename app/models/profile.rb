class Profile < ApplicationRecord
  validates :family_name, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :given_name, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :family_name_kana, format: { with: /\A[ぁ-んー－]+\z/}
  validates :given_name_kana, format: { with: /\A[ぁ-んー－]+\z/}
  validates :birthday, presence: true

  belongs_to :user, optional: true
end
