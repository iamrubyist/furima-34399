class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  with_options presence: true do
   validates :name
   validates :birthday
   validates :password, length: { maximum: 6 }, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i} 
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :first_name
    validates :last_name
  end

   with_options presence:true, format: {with: /\A[ァ-ヶー－]+\z/ } do
   validates :first_name_jp
   validates :last_name_jp
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
