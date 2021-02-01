require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '出品情報の登録' do
    context '出品登録ができる場合' do
      it '全ての項目が埋まっていると登録できる' do
        expect(@item).to be_valid
      end
      it '商品名が40文字までなら登録できる' do
        @item.name = "あ" * 40
        expect(@item).to be_valid
      end
      it '商品の説明が1000文字までなら登録できる' do
        @item.description = "あ" * 1000
        expect(@item).to be_valid
      end
      it '値段設定が300円以上なら登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '値段設定が9999999円までなら登録出来る' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

  end
end
