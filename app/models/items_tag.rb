class ItemsTag
  include ActiveModel::Model
  attr_accessor :user_id, :name, :description, :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :price, :images, :tag
  extend ActiveHash::Associations::ActiveRecordExtensions

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

  def save
    item = Item.create(name: name, description: description, category_id: category_id, condition_id: condition_id, shipping_burden_id: shipping_burden_id, prefecture_id: prefecture_id, days_to_ship_id: days_to_ship_id, price: price,user_id: user_id, images: images)
    @tag = Tag.where(tag: tag).first_or_initialize
    @tag.save
    binding.pry
    
    ItemTagRelation.create(item_id: item.id, tag_id: @tag.id)
    binding.pry
  end
end