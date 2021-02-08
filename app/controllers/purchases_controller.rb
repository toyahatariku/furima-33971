class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    if !user_signed_in? # ログインしていないとログインページへ遷移する
      redirect_to new_user_session_path
    elsif current_user.id == @item.user_id # ログインユーザーが出品者と同じならトップページへ遷移する
      redirect_to root_path
    elsif nil != (Purchase.find_by(item_id: @item.id))  # 商品が購入済みならトップページへ遷移する
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchases_params)
    if @purchase_address.valid?
      @purchase_address.save
      pay_item
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchases_params
    params.permit(:item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id, :token).merge(
      user_id: current_user.id, price: @item.price
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchases_params[:price],
      card: purchases_params[:token],
      currency: 'jpy'
    )
  end

  def back_index
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
