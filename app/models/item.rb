class Item < ApplicationRecord
  # 出品品
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_burden
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one :purchase, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  # 商品名は40文字まで
  validates :name, length: { maximum: 40 }

  # 商品説明は1000文字まで
  validates :description, length: { maximum: 1000 }

  # 選択肢が"---"の時は保存できない
  validates :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }

  # priceの数値が半角のみで300以上 9,999,999以下
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # 記入必須
  with_options presence: true do
    validates :name, :description, :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id,
              :price, :images
  end
end
