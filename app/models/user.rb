class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence:true, uniqueness: true

  with_options presence: true do
    validates :encrypted_password, :nickname, :first_name, :second_name, :first_name_kana, :second_name_kana, :birthday
  end

end
