class CreateBuyMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_markets do |t|

      t.timestamps
    end
  end
end
