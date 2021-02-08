class Address < ApplicationRecord
  # 購入者住所
  belongs_to :purchase
end
