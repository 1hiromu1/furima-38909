class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

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
    common_item
  end

  def edit
    common_item
    redirect_to root_path unless current_user == @item.user
  end

  def update
    common_item
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
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
