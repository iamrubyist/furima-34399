class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  with_options presence: true do
  validates :name
  validates :first_name, with: /\A[ぁ-んァ-ヶ一-龥]/+\z
  validates :last_name, with: /\A[ぁ-んァ-ヶ一-龥]/+\z
  validates :first_name_jp, with: /\A[ァ-ヶー－]+\z/
  validates :last_name_jp, with: /\A[ァ-ヶー－]+\z/
  validates :birthday
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
