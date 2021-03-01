class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title,           null: false
      t.text       :text,            null: false
      t.integer    :genre_id,        null: false
      t.integer    :category_id,     null: false
      t.integer    :item_status,     null: false
      t.integer    :delivery_id,     null: false
      t.integer    :area_id,         null: false
      t.integer    :days_to_ship_id, null: false
      t.timestamps
    end
  end
end
