class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchases_params)
    if @purchase_address.valid?
      @purchase_address.save
      pay_item
      redirect_to item_path(@item.id)
    else
      render 'index'
    end
  end
  
  private
  
  def purchases_params
    params.permit(:item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id, :token).merge(user_id: current_user.id, price: @item.price)
  end
  
  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: purchases_params[:price],
        card: purchases_params[:token],
        currency:'jpy'
      )
   end

end