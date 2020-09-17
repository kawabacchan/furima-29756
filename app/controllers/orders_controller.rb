class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  private
  
  def move_to_root
    if user_signed_in? && current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    end
  end

end
