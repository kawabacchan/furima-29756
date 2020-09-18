class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(token: order_params[:token])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
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

  def pay_item
    Payjp.api_key = "sk_test_b0b7c4da50610557d0e74e00"
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
