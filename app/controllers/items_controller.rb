class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :content, :category, :item_status, :delivery_fee, :seller_area, :days_to_ship, :price, :image).merge(user_id: current_user.id)
  end
end
