require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @buy_user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    sleep 0.1
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @buy_user.id, item_id: @item.id)
  end

  describe '購入者住所記録' do
    context '記録する場合' do
      it '全ての項目が埋まっていると購入者住所が記録される' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空であっても購入者住所が記録される' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
      it '電話番号が10桁でも記録出来る' do
        @purchase_address.phone_number = '0123456789'
        expect(@purchase_address).to be_valid
      end
    end

    context '記録されない場合' do
      it '郵便番号が空だと記録されない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "郵便番号を入力してください"
      end
      it '郵便番号が7桁でないと記録されない' do
        @purchase_address.postal_code = '012-345'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '郵便番号「-」を含む且つ7桁で入力して下さい'
      end
      it '郵便番号にハイフンが入っていないと記録されない' do
        @purchase_address.postal_code = '0123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '郵便番号「-」を含む且つ7桁で入力して下さい'
      end

      it '都道府県が空だと記録されない' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "発送元の地域を入力してください"
      end
      it '都道府県の選択が1「---」だと記録されない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '発送元の地域は1以外の値にしてください'
      end

      it '市区町村が空だと記録されない' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "市区町村を入力してください"
      end

      it '番地が空だと記録されない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "番地を入力してください"
      end

      it '電話番号が空だと記録されない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "電話番号を入力してください"
      end
      it '電話番号が全角数字だと記録されない' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '電話番号「-」無しの半角10桁か11桁で入力して下さい'
      end
      it '電話番号が英数字混合だと記録されない' do
        @purchase_address.phone_number = '0901234abcd'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '電話番号「-」無しの半角10桁か11桁で入力して下さい'
      end
      it '電話番号にハイフンが入っていると記録されない' do
        @purchase_address.phone_number = '090-1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '電話番号「-」無しの半角10桁か11桁で入力して下さい'
      end
      it '電話番号が12桁以上だと記録されない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '電話番号「-」無しの半角10桁か11桁で入力して下さい'
      end
      it '電話番号が9桁以下だと記録されない' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '電話番号「-」無しの半角10桁か11桁で入力して下さい'
      end

      it 'トークンが空だと記録されない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "クレジットカード情報を入力してください"
      end
      it 'user_idが無いと記録されない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Userを入力してください"
      end
      it 'item_idが無いと記録されない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Itemを入力してください"
      end
    end
  end
end
