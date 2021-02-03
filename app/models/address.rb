class Address < ApplicationRecord
# 購入者住所
  belongs_to :purchase

  # 記入必須
  with_options presence: true do
    validates :purchase, :postal_code, :prefecture_id, :municipality, :address, :phone_number
  end

end
