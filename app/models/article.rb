class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :days_to_ship, :prefecture, :shipping_burden

  validates :title, :text, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :days_to_ship_id, :prefecture_id, :shipping_burden_id
  end
end
