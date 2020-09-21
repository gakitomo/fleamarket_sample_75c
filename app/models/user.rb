class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, password_length: 7..128

  validates :nickname, presence: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/}, allow_blank: true
  validates :email, presence: true

  has_many :items, dependent: :destroy
  has_one :address
  has_one :profile
  accepts_nested_attributes_for :profile

          
  has_secure_password

  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

 
  
  has_many :buyed_items,foreign_key: "buyer_id",class_name: 'Item'
  has_many :selling_items, -> {where("buyer_id is NULL")}, foreign_key: "seller_id",class_name: "Item"
  has_many :sold_items, ->{where('buyer_id is not NULL')}, foreign_key:'seller_id',class_name:'Item'
  


  has_one :card, dependent: :destroy

end
