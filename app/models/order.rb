class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :receive_address
  
end
