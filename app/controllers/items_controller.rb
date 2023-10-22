class ItemsController < ApplicationController
  def index
  end

  def new 
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :status_id, :prefecture_id, :burden_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
