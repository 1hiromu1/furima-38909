class OrdersController < ApplicationController
  before_action :check_user, only: [:index]


  def index
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new(order_information_params)
    if @order_information.valid?
      pay_item
      @order_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_information_params
    params.require(:order_information).permit(:item_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_information_params[:token],
      currency: 'jpy'
    )
  end

  def check_user
    @item = Item.find(params[:item_id])
    @order = Order.find_by(item_id: @item.id, user_id: current_user.id)

    if user_signed_in?
      if current_user == @item.user || (@order && @item.id == @order.item_id)
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

end
