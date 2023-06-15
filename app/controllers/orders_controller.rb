class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new
  end

  def new
    @order_information = OrderInformation.new
  end

  def create
    @order_information = OrderInformation.new(order_information_params)
    if @order_information.valid?
      @order_information.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_information_params
    params.require(:order_information).permit(:item_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id)
  end

end
