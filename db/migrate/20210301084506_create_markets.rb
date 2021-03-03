class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.string     :name,            null: false
      t.text       :item_text,       null: false
      t.integer    :category_id,     null: false
      t.integer    :item_status_id,  null: false
      t.integer    :delivery_id,     null: false
      t.integer    :area_id,         null: false
      t.integer    :days_to_ship_id, null: false
      t.integer    :price,           null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
