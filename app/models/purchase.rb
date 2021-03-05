class Purchase < ApplicationRecord
  with_options presence: true do
    validates :postal_code_id
    validates :prefectures
    validates :municipality
    validates :address
    validates :phone_number
    validates :buy_market
  end
end
