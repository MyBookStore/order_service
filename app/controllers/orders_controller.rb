class OrdersController < ApplicationController

  CREATED = 201

  def create
    order_params.to_hash.merge!("status" => "confirmed")
    @order = Order.create(order_params)
    @order.save!
    render :show, status: CREATED
  end

  def get
    @order = Order.where(id: params[:id])
    render :show, status: 200
  end

  def search
    @order = Order.find_by(params[:order])
    if @order
      render :show, status: :ok
    else
      render :no_order, :bad_request
    end
  end

  def order_params
    params.permit(:customer_id, :book_id)
  end
end
