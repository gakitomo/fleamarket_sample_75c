class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          
  has_secure_password

  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :birthday, presence: true
  
  has_many :items
  has_many :buyed_items,foreign_key: "buyer_id",class_name: 'Item'
  has_many :selling_items, -> {where("buyer_id is NULL")}, foreign_key: "seller_id",class_name: "Item"
  has_many :sold_items, ->{where('buyer_id is not NULL')}, foreign_key:'seller_id',class_name:'Item'
  


  has_one :card, dependent: :destroy

end
