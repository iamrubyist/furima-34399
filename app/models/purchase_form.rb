class PurchaseForm
  include ActiveModel::Model

  attr_accessor :postal_code_id, :prefectures, :municipality, :address,:phone_number,:building_name,:market_id,:user_id
  
  with_options presence: true do
    validates :postal_code_id
    validates :prefectures
    validates :municipality
    validates :address
    validates :phone_number
  end
    validates :phone_number, numericality: true
    validates :phone_number, length: {maximum: 11}
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :postal_code_id, format: {with: /\A\d{3}[-]\d{4}\z/} 
  def save
    buy_market = BuyMarket.create!(user_id: user_id, market_id: market_id)
    Purchase.create!(
      postal_code_id: postal_code_id, 
      prefectures: prefectures,
      municipality: municipality,
      address: address,
      phone_number: phone_number,
      building_name: building_name,
      buy_market_id: buy_market.id
      )
  end
end