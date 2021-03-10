class BuyMarket < ApplicationRecord
  belongs_to :user
  belongs_to :market 
  has_one    :purchase
end
