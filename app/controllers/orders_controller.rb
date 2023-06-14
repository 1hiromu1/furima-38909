class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new
  end
end
