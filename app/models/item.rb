class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship
  has_one_attached :image
 
  with_options presence: true do
   validates :image
   validates :product_name
   validates :product_text
  end
 end