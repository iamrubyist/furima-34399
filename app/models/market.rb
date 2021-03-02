class Market < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
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
  validates :title, :text, presence: true

  validates :genre_id, numericality: { other_than: 0 } 
  
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery
  belongs_to :area 
  belongs_to :days_to_ship
end
