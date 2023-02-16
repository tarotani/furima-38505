class OrdersController < ApplicationController
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
     @order_form = OrderForm.new(order_params)
     if @order_form.valid?
      #pay_item
      @order_form.save
      redirect_to root_path
     else
      render :index
     end
  end

  private

  def order_params
    # この時点では、order_idが不要。またrequire外の情報は参照するため、mergeとする。
    params.require(:order_form).permit(:postalcode, :first_add_id, :second_add, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])#, token: params[:token])
  end


  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end
