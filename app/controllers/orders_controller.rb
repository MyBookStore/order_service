class OrdersController < ApplicationController
  def create
    @order = Order.create(order_params)
    render :show, status: 201
  end

  def get
    @order = Order.where(params[:id]).first
    render :show, status: 200
  end

  def search
    @order = Order.find_by(params[:order])
    if @order
      render :show, status: :ok
    else
      render :error, :bad_request
    end
  end

  def order_params
    params.permit(:customer_id, :book_id, :status)
  end
end
