class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_order, only: [:index, :create]

def index
  @order_destinaton = OrderDestination.new
end




def create
  @order_destinaton = OrderDestination.new(order_params)
  if @order_destination.valid?
     @order_destinaton.save
     redirect_to root_path
  else
    render :index, status: unprocessable_entity
  end
end




private

def order_params
  params.require(:order_destinaton).permit(:post_code, :prefecture_id, :cities, :street_address, :building, :telephone, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
end

def set_order
  @item = Item.find(params[:item_id])
end
end
