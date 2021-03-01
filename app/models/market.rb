class Market < ApplicationRecord
  with_options presence: true do
    validates :name 
    validates :item_text
    validates :category_id
    validates :item_text
    validates :delivery_id
    validates :area_id
    validates :days_to_ship_id
    validates :price
    validates :user
  end 
  
  has_one_attached :image
  belongs_to :user
end
