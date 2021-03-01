class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genere

  validates :title, :text, presence: true

  validates :genere_id, numericality: { other_than: 1 } 
end
