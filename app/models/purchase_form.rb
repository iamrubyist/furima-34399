class PurchaseForm
  include ActiveModel::Model

  attr_accessor :postal_code_id, :prefectures, :municipality, :address,:phone_number, :buy_market
  validates :purchase, presence: true
  validates :address, presence: true
 
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