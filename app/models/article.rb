class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery
  belongs_to :area
  belongs_to :days_to_ship
  has_one :user

  validates :title, :text, presence: true

  validates :genre_id, numericality: { other_than: 1 } 
end
