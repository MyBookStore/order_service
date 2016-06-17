class OrdersController < ApplicationController

  def create
    order_p = order_params.to_hash.merge("status" =>  "confirmed")
    @order = Order.create(order_p)
    @order.save!
    render json:@order, status: 201
  end

  def get
    @order = Order.where(id: params[:id])
    render json: @order, status: 200
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
    params.permit(:customer_id, :book_id)
  end
end
