class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :postal_code_id,     null: false
      t.integer    :prefectures,        null: false
      t.string     :municipality,       null: false
      t.string     :address,            null: false
      t.string     :phone_number,       null: false
      t.string     :building_name,      null: false
      t.references :buy_market,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
