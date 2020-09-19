class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, password_length: 7..128

  validates :nickname, presence: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/}

  has_many :items, dependent: :destroy
  has_one :address
  has_one :profile
  accepts_nested_attributes_for :profile
end
