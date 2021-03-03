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

  with_options numericality: { other_than: 0 } do
  validates :category_id 
  validates :item_status_id
  validates :delivery_id 
  validates :area_id
  validates :days_to_ship_id
  end

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 10_000_000 }
  validates :price, format: { with: /\A[a-zA-Z0-9]+\z/}
  validates :price, format: { with: /\A[a-zA-Z]+\z/}
  validates :price, format: { with:  /\A[ぁ-んァ-ヶ一-龥々]+\z/}
 
  has_one_attached :image
  def was_attached?
    self.image.attached?
  end


end
