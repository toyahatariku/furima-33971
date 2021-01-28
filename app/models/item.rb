class Item < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :user, :name, :description, :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :price
end
