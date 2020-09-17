class Order < ApplicationRecord
  belongs_to :item
  belongs_to :users
  has_one :receive_address
  
end
