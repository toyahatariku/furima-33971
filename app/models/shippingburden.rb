class Shippingburden < ActiveHash::Base
  # 配送料の負担
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い（購入者負担）' },
    { id: 3, name: '送料込み（出品者負担）' }
  ]

  include ActiveHash::Associations
  has_many :items
end
