class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_order, only: [:index, :create]

def index
  gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  @order_destination = OrderDestination.new
end




def create
  
  @order_destination = OrderDestination.new(order_params)
  
  if @order_destination.valid?
    pay_item
    @order_destination.save
    redirect_to root_path
     
  else
    render :index, status: :unprocessable_entity
  end
end




private

def order_params
  params.require(:order_destination).permit(:post_code, :prefecture_id, :cities, :street_address, :building, :telephone, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

def set_order
  @item = Item.find(params[:item_id])
end

def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
      amount:@item.price,
      card:order_params[:token],    
      currency:'jpy'  
    )
end
end
