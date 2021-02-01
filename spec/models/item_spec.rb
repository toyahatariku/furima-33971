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

  end

end
