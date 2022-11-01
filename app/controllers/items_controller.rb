class ItemsController < ApplicationController
  def index

  end

  def new
    @item=Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end




  private

  def item_params
    params.require(:item).permit(:image,:neme,:information,:condition_id,:category_id,:state_id,:shipping_id,:delivery_days_id,:item_price).merge(user_id: current_user.id)
  end
  

end
