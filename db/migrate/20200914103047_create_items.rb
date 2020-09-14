class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.integer :category, null: false
      t.integer :item_status, null: false
      t.integer :delivery_fee, null: false
      t.integer :seller_area, null: false
      t.integer :day_to_ship, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
