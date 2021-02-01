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

    context '出品登録ができない場合' do
      it '商品名が空だと登録できない' do

      end
      it '商品名が41文字以上だと登録できない' do

      end

      it '説明が空だと登録できない' do

      end
      it '説明が1000文字以上だと登録できない' do

      end


      it 'カテゴリーが空だと登録できない' do

      end
      it 'カテゴリーの選択が1だと登録できない' do

      end
      it '商品状態が空だと登録できない' do

      end
      it '商品状態の選択が1だと登録できない' do

      end
      it '発送料の負担が空だと登録できない' do

      end
      it '発送料の負担の選択が1だと登録できない' do

      end
      it '発送元の地域が空だと登録できない' do

      end
      it '発送元の地域の選択が1だと登録できない' do

      end
      it '発送までの日数が空だと登録できない' do

      end
      it '発送までの日数の選択が1だと登録できない' do

      end

      it '販売価格が空だと登録できない' do

      end
      it '販売価格が300円未満だと登録できない' do

      end
      it '販売価格が10,000,000円以上だと登録できない' do

      end
    end

  end
end
