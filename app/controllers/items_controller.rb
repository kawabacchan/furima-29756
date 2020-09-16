class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :content, :category_id, :item_status_id, :delivery_fee_id, :seller_area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
