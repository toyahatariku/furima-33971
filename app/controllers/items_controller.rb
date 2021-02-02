class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_find_id, only: [:show, :edit, :update, :destroy]
  before_action :back_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_burden_id, :prefecture_id,
                                 :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_find_id
    @item = Item.find(params[:id])
  end

  def back_index
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
