class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :prefecture, :city, :house_number, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than:1, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{0,11}\z/, message: "is invalid. Only numbers"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ReceiveAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end