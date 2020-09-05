class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          
  has_secure_password

  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  # ユーザーのアカウントが有効であることを確認 
  # def active_for_authentication?  
  #   super && !deleted_at  
  # end  

  # 削除したユーザーにカスタムメッセージを追加します  
  # def inactive_message   
  #   !deleted_at ? super : :deleted_account  
  # end 

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :birthday, presence: true

  has_one :card, dependent: :destroy
end
