class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :redirect_index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:zip, :state_id, :city, :addressline1, :addressline2, :tell).merge(user_id: current_user.id,
                                                                                                             item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def redirect_index
    redirect_to root_path if @item.user_id == current_user.id || @item.order.present? == true
  end
end
