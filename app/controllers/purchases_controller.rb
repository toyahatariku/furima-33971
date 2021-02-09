class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit]
  before_action :item_param, only: [:index, :create]
  before_action :back_index, only: [:index]
  before_action :solditem_to_top, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchases_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_param
    @item = Item.find(params[:item_id])
  end

  def solditem_to_top
    redirect_to root_path if nil != (Purchase.find_by(item_id: @item.id))  # 商品が購入済みならトップページへ遷移する
  end

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
    redirect_to root_path if current_user.id == @item.user_id
  end
end
