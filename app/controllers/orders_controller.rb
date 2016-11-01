class OrdersController < ApplicationController
  def new
    @order=Order.new
  end
  def create
    @order=Order.new#(order_params)
    if @order.save
      flash[:success]="Bought!"
      redirect_to root_path
    else
      flash[:error]="#{@order.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  # def order_params
  #   params.require(:order).permit(:ticket_types, :quantity, :phonenumber)
  # end
end
