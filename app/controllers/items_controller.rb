class ItemsController < ApplicationController
  def new
    @item = Item.new
    redirect_to(new_user_session_path) unless user_signed_in?
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_burden_id, :prefecture_id,
                                 :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
