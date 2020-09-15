class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :seller_area
  belongs_to_active_hash :days_to_ship

  validates :name, :content, :category, :item_status, :delivery_fee, :seller_area, :days_to_ship, :price, :image, presence: true
  validates :category_id, :item_status_id, :delivery_fee_id, :seller_area_id, :days_to_ship_id, numericality: {other_than: 1}

end
