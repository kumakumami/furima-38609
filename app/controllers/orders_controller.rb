class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @address = Address.new
  end



  def create
    binding.pry
    
  end
end
