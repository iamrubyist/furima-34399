class CreateShoppingaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppingaddresses do |t|
      t.string     :postal_code_id,     null: false
      t.integer    :prefectures_id,     null: false
      t.string     :municipality,       null: false
      t.string     :address,            null: false
      t.string     :phone_number,       null: false
      t.string     :building_name 
      t.references :buy_market,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
