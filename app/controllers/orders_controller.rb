class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :set_user, only: [:index, :create]
  before_action :set_another_user, only: [:index, :create]
  before_action :set_roguouto, only: [:index, :create]
  before_action :set_gon, only: [:index, :create]



def index
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
  params.require(:order_destination).permit(:post_code, :prefecture_id, :cities, :street_address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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

def  set_user
  if user_signed_in? && current_user.id == @item.user_id
    redirect_to root_path
  end
end

def set_another_user
  if user_signed_in? && current_user.id != @item.user_id && @item.order != nil
    redirect_to root_path
  end
end

def set_roguouto
  unless user_signed_in?
    redirect_to new_user_session_path
  end
end

def set_gon
  gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
end
end
