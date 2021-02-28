class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,          presence: :true
  validates :first_name,    presence: :true
  validates :last_name,     presence: :true
  validates :first_name_jp, presence: :true
  validates :last_name_jp,  presence: :true
  validates :birthday,      presence: :true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
