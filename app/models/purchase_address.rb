class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number,
                :price

  # 必須項目バリデーション
  with_options presence: true do
    # 購入履歴
    validates :user_id
    validates :item_id
    # 購入者住所
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: '「-」を含む且つ7桁で入力して下さい' }
    validates :prefecture_id, numericality: { other_than: 1}
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '「-」無しの半角10桁か11桁で入力して下さい' }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                   phone_number: phone_number, purchase_id: purchase.id)
  end
end
