class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  has_one_attached :image
 
  with_options presence: true do
   validates :image
   validates :product_name
   validates :product_text
  end
 end