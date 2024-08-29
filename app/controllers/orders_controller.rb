class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show ]

  # GET /orders
  def index
    # list order untuk halaman list bagi admin 
    @orders = Order.all
  end

  # GET /orders/1
  def show
    # list order untuk halaman detail bagi admin
  end

  # GET /orders/new
  # STATE order disini belum dicatat
  def new
    # form untuk checkout page
    @order = Order.new
  end


  # POST /orders
  # STATE order disini sudah menjadi PENDING
  def create
    @order = Order.new(order_params)

    if @order.checkout
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # state machine yang lain disini
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :total_price)
    end
end
