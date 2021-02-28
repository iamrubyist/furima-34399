class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  with_options presence: true do
  validates :name
  validates :first_name
  validates :last_name
  validates :first_name_jp
  validates :last_name_jp
  validates :birthday
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
