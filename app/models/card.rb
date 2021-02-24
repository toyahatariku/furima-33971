class Card < ApplicationRecord

  belongs_to :user
  with_options presence: true do
    validates :user_id, :card_token, :customer_token
  end
end
