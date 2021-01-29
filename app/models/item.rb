class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shippingburden
  belongs_to :prefecture
  belongs_to :daystoship

  belongs_to :user
  has_one_attached :image

  # 選択肢が"---"の時は保存できない
  validates :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 } 

  # priceの数値が半角のみで300以上 9,999,999以下
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  # 記入必須
  with_options presence: true do
    validates :user, :name, :description, :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id,  :price, :image
  end

end
