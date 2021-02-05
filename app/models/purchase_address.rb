class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id

    # 購入履歴  記入必須バリデーション
  with_options presence: true do
    validates :user_id, :item_id
  end
  
    # 購入者住所 記入必須バリデーション(建物名以外)
  with_options presence: true do
    validates  :postal_code, :prefecture_id, :municipality, :address, :phone_number
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, phone_number: phone_number, purchase_id: purchase.id)
  end

end
