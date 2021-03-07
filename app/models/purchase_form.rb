class PurchaseForm
  include ActiveModel::Model

  attr_accessor :postal_code_id, :prefectures, :municipality, :address,:phone_number, :buy_market, :user_id
  with_options presence: true do
    validates :postal_code_id
    validates :prefectures
    validates :municipality
    validates :address
    validates :phone_number
    validates :buy_market
  end
 
  def save
    buy_market = BuyMarket.create(user_id: user_id, buy_market_id: buy_market_id)
    Purchase.create(
      postal_code_id: postal_code_id, 
      prefectures: prefectures,
      municipality: municipality,
      address: address,
      phone_number: phone_number,
      buy_market_id: buy_market.id)
  end
end