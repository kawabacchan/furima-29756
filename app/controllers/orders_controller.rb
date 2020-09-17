class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_params)
    @order.save
  end

  private
  
  def move_to_root
    if user_signed_in? && current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:token, :postal_code, :prefecture, :city, :house_number, :building, :phone_number)
  end

end
