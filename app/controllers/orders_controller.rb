class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_order, only: [:index, :create]

def index
  @order_destination = OrderDestination.new
end




def create
  
  @order_destination = OrderDestination.new(order_params)
  
  if @order_destination.valid?
      Payjp.api_key = "sk_test_6d832e777ff198b0c8f82348"  
      Payjp::Charge.create(
        amount:@item.price,
        card:order_params[:token],    
        currency:'jpy'  
      )
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
end
