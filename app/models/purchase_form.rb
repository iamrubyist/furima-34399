class PurchaseForm
  include ActiveModel::Model

  attr_accessor :purchase, :address
  validates :purchase, presence: true
  validates :address, presence: true
 
  def save
    Purchase.create(purchase: purchase)
    Adderss.create(address: address)
  end
end