FactoryBot.define do
  factory :market do
    name                  {'test'}
    item_text             {'これは限定商品です'}
    category_id           {'1'}
    item_status_id        {'1'}
    delivery_id           {'1'}
    area_id               {'1'}
    days_to_ship_id       {'1'} 
    price                 {'1000'}
  end
end