class CreateBuyMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_markets do |t|
      t.integer :market_id, null: false, foreign_key: true
      t.integer :user_id,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
