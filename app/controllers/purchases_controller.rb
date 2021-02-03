class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
binding.pry
    # @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      # pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  # def purchase_params
  #   params.require(:purchase).permit(:price)
  # end

#   def pay_item
#     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
#     Payjp::Charge.create(
#       amount: order_params[:price],
#       card: order_params[:token],
#       currency:'jpy'
#     )
#  end
end
