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
    end

    context '出品登録ができない場合' do
      it '商品画像が無いと登録できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it '商品名が41文字以上だと登録できない' do
        @item.name = 'あ' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include '商品名は40文字以内で入力してください'
      end

      it '説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it '説明が1001文字以上だと登録できない' do
        @item.description = 'あ' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の説明は1000文字以内で入力してください'
      end

      it 'カテゴリーが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーを入力してください'
      end
      it 'カテゴリーの選択が1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーは1以外の値にしてください'
      end
      it '商品状態が空だと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態を入力してください'
      end
      it '商品状態の選択が1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態は1以外の値にしてください'
      end
      it '発送料の負担が空だと登録できない' do
        @item.shipping_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担を入力してください'
      end
      it '発送料の負担の選択が1だと登録できない' do
        @item.shipping_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担は1以外の値にしてください'
      end
      it '発送元の地域が空だと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域を入力してください'
      end
      it '発送元の地域の選択が1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域は1以外の値にしてください'
      end
      it '発送までの日数が空だと登録できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数を入力してください'
      end
      it '発送までの日数の選択が1だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数は1以外の値にしてください'
      end

      it '販売価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end
      it '販売価格が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は300以上の値にしてください'
      end
      it '販売価格が10,000,000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は9999999以下の値にしてください'
      end
      it '販売価格が全角数字だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end
      it '販売価格が半角英数混合だと登録できない' do
        @item.price = '1000yen'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end
      it '販売価格が英字だと登録できない' do
        @item.price = 'thousand'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end
    end
  end
end
