class ItemsController < ApplicationController
  def index
  end
  
  def new    
    unless user_signed_in?
      redirect_to(new_user_session_path)
    end
  end

  def create
    @item.save(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

end
