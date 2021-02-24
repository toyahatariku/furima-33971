class Purchase < ApplicationRecord
  # 購入履歴
  belongs_to :user
  belongs_to :item
  has_one :address, dependent: :destroy
end
