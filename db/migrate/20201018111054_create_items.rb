class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.text   :product_text
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
      
     #Activehash
     t.integer :category_id,    null: false
     t.integer :product_condition_id,    null: false
     t.integer :shipping_charge_id,    null: false
     t.integer :shipping_area_id,    null: false
     t.integer :days_to_ship_id,    null: false
    end
  end
end
