class Market < ApplicationRecord
  with_options presence: true do
    validates :name 
    validates :item_text
    validates :category_id
    validates :item_status_id
    validates :delivery_id
    validates :area_id
    validates :days_to_ship_id
    validates :price
    validates :user
  end 
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery
  belongs_to :area 
  belongs_to :days_to_ship

  validates :category_id,     numericality: { other_than: 0 } 
  validates :item_status_id,  numericality: { other_than: 0 } 
  validates :delivery_id,     numericality: { other_than: 0 } 
  validates :area_id,         numericality: { other_than: 0 } 
  validates :days_to_ship_id, numericality: { other_than: 0 } 
end
