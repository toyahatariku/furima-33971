class Tag < ApplicationRecord
  has_many :item_tag_relations
  has_many :items, through: :item_tag_relations

  validates :tag, uniqueness: true #一意性のバリデーション
end
