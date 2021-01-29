class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :shipping_burden_id
  belongs_to :prefecture_id
  belongs_to :days_to_ship_id

  belongs_to :user
  has_one_attached :imgae

  with_options presence: true do
    validates :user, :name, :description, :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :price
  end

end
