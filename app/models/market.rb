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
    validates :image
  end 
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery
  belongs_to :area 
  belongs_to :days_to_ship

  with_options numericality: { other_than: 0 } do
  validates :category_id 
  validates :item_status_id
  validates :delivery_id 
  validates :area_id
  validates :days_to_ship_id
  end

  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
 
  has_one_attached :image
  def was_attached?
    self.image.attached?
  end


end
