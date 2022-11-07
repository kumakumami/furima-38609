class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
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

  def edit
    
    @item=Item.find(items[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @item=Item.find(itens[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit 
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :condition_id, :category_id, :state_id, :shipping_id, :deliveryday_id,
                                 :item_price).merge(user_id: current_user.id)
  end
end
