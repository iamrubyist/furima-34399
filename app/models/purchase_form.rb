class PurchaseForm
  include ActiveModel::Model

  attr_accessor :postal_code_id, :prefectures, :municipality, :address,:phone_number, :buy_market
  with_options presence: true do
    validates :postal_code_id
    validates :prefectures
    validates :municipality
    validates :address
    validates :phone_number
    validates :buy_market
  end
 
  def save
    Purchase.create(
      postal_code_id: postal_code_id, 
      prefectures: prefectures,
      municipality: municipality,
      address: address,
      phone_number: phone_number,
      buy_market: buy_market)
    Adderss.create(address: address)
  end
end