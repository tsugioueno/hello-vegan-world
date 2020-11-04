class CreateItemPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :item_purchases do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end