class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence:true
# 英数字を含めるパスワード
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true, format:  { with: PASSWORD_REGEX} do
    validates :password, :password_confirmation, presence:true
  end
# 全角文字のみの名前 
  ZENKAKU_MOJI = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  with_options presence: true, format: { with: ZENKAKU_MOJI} do
    validates :first_name, :second_name
  end
# カタカナのみの名前
  KATAKANA_MOJI = /\A[ァ-ヶ]+\z/.freeze
  with_options presence: true, format: { with: KATAKANA_MOJI} do
    validates :first_name_kana, :second_name_kana
  end

# 記入必須
  with_options presence: true do
    validates :nickname, :birthday
  end

end
