class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :destroy]



  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy 
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :category_id, :status_id, :prefecture_id, :burden_id,
                                 :shipping_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?
    redirect_to new_user_session_path
  end

  def set_item
   @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  
end
