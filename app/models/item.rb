class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id

  belongs_to :user
  has_one_attached :imgae


end
