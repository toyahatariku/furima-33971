class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id ,:token ,:price

  # 必須項目バリデーション
  with_options presence: true do
    # 購入履歴
    validates :user_id
    validates :item_id
    # 購入者住所
    validates :postal_code    ,format: {with: /\A\d{3}[-]\d{4}\z/, message: "郵便番号は「-」を含む且つ7桁"}
    validates :prefecture_id  ,numericality: { other_than: 1 , message: "都道府県を選んで下さい"}
    validates :municipality   
    validates :address        
    validates :phone_number   ,format: {with: /\A\d{10,11}\z/, message: "電話番号は10桁か11桁"}
  end
  

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, phone_number: phone_number, purchase_id: purchase.id)
  end

end
