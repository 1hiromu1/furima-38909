class OrdersController < ApplicationController
  def index
    @order_information = OrderInformation.new
  end
end
