class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :product_name
      t.text   :product_text
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
