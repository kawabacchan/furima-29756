class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :item_status, presence: true
  validates :delivery, presence: true
  validates :seller_area, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true

end
