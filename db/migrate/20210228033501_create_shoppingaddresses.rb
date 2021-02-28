class CreateShoppingaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppingaddresses do |t|

      t.timestamps
    end
  end
end
