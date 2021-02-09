class User < ApplicationRecord
  # 登録者情報
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  # 英数字を含めるパスワード
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  with_options format: { with: PASSWORD_REGEX }, allow_blank: true do
    validates :password, :password_confirmation, presence: true
  end
  # 全角（ひらがな・カタカナ・漢字）のみの名前と苗字
  ZENKAKU_MOJI = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  with_options format: { with: ZENKAKU_MOJI }, allow_blank: true do
    validates :first_name, :second_name
  end
  # カタカナのみの名前と苗字
  KATAKANA_MOJI = /\A[ァ-ヶ]+\z/.freeze
  with_options format: { with: KATAKANA_MOJI }, allow_blank: true do
    validates :first_name_kana, :second_name_kana
  end
  # 記入必須
  with_options presence: true do
    validates :first_name, :second_name, :first_name_kana, :second_name_kana, :nickname, :birthday
  end
end
