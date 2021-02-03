class Purchase < ApplicationRecord
# 購入履歴 
  belongs_to :user
  belongs_to :item
  has_one :address

  # 記入必須
  with_options presence: true do
    validates :user, :item
  end

end
