class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
  purchase = Purchase.create(purchase_params(params))
  Address.create(address_params(params,purchase))
    # if purchase.valid?
      # pay_item
      # purchase.save
      # return redirect_to root_path
    # else
    #   render 'index'
    # end
  end

  # private

  def purchase_params(params)
    params.permit(:item_id).merge(user_id: current_user.id)
  end
  def address_params(params,purchase)
   params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(purchase_id: purchase.id)
  end
  
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency:'jpy'
      )
   end

end