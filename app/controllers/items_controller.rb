class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :common_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: 'DESC')
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

  def show
    @order = Order.find_by(item_id: @item.id)
  end

  def edit
    @order = Order.find_by(item_id: @item.id)
    redirect_to root_path unless @order.nil? || (current_user == @item.user && @item.id != @order.item_id)
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    return unless current_user == @item.user

    @item.destroy
    redirect_to root_path
  end

  private

  def common_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :item_description, :image, :category_id, :item_condition_id, :delivery_id,
                                 :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
