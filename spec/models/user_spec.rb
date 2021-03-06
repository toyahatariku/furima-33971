require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録が出来る場合' do
      it '全ての項目が埋まっていると登録できる' do
        expect(@user).to be_valid
      end

      it '苗字が全角（漢字）だと登録できる' do
        @user.first_name = '漢字'
        expect(@user).to be_valid
      end

      it '苗字が全角（ひらがな）だと登録できる' do
        @user.first_name = 'ひらがな'
        expect(@user).to be_valid
      end

      it '苗字が全角（カタカナ）だと登録できる' do
        @user.first_name = 'カタカナ'
        expect(@user).to be_valid
      end

      it '名前が全角（漢字）だと登録できる' do
        @user.second_name = '漢字'
        expect(@user).to be_valid
      end

      it '名前が全角（ひらがな）だと登録できる' do
        @user.second_name = 'ひらがな'
        expect(@user).to be_valid
      end

      it '名前が全角（カタカナ）だと登録できる' do
        @user.second_name = 'カタカナ'
        expect(@user).to be_valid
      end
    end

    context '新規登録が出来ない場合' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end

      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end

      it 'メールアドレスが重複していると登録できない' do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.password_confirmation = @user.password_confirmation
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end

      it 'メールアドレスに@が含まれていないと登録できない' do
        @user.email = 'tesst.test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end

      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end

      it 'パスワードが６文字未満だと登録できない' do
        @user.password = '123av'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end

      it 'パスワードは数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'パスワードは英数のみだと登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'パスワードは全角だと登録できない' do
        @user.password = '１２３ABC'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'パスワード（確認用）が空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it 'パスワードがパスワード（確認用）と一致してないと登録できない' do
        @user.password_confirmation = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it '苗字が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名字を入力してください"
      end

      it '苗字が英字だと登録できない' do
        @user.first_name = 'ABC'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字は不正な値です'
      end

      it '苗字が数字だと登録できない' do
        @user.first_name = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字は不正な値です'
      end

      it '苗字が半角だと登録できない' do
        @user.first_name = 'ｱｲｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字は不正な値です'
      end

      it '名前が空だと登録できない' do
        @user.second_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end

      it '名前が英字だと登録できない' do
        @user.second_name = 'ABC'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は不正な値です'
      end

      it '名前が数字だと登録できない' do
        @user.second_name = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は不正な値です'
      end

      it '名前が半角だと登録できない' do
        @user.second_name = 'ｱｲｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は不正な値です'
      end

      it '苗字（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名字（カナ）を入力してください"
      end

      it '苗字（カナ）がひらがなだと登録できない' do
        @user.first_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字（カナ）は不正な値です'
      end

      it '苗字（カナ）が漢字だと登録できない' do
        @user.first_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字（カナ）は不正な値です'
      end

      it '苗字（カナ）が数字だと登録できない' do
        @user.first_name_kana = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字（カナ）は不正な値です'
      end

      it '苗字（カナ）が英字だと登録できない' do
        @user.first_name_kana = 'ABC'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字（カナ）は不正な値です'
      end

      it '苗字（カナ）が半角だと登録できない' do
        @user.first_name_kana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字（カナ）は不正な値です'
      end

      it '名前（カナ）が空だと登録できない' do
        @user.second_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（カナ）を入力してください"
      end

      it '名前（カナ）がひらがなだと登録できない' do
        @user.second_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（カナ）は不正な値です'
      end

      it '名前（カナ）が漢字だと登録できない' do
        @user.second_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（カナ）は不正な値です'
      end

      it '名前（カナ）が数字だと登録できない' do
        @user.second_name_kana = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（カナ）は不正な値です'
      end

      it '名前（カナ）が英字だと登録できない' do
        @user.second_name_kana = 'ABC'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（カナ）は不正な値です'
      end

      it '名前（カナ）が半角だと登録できない' do
        @user.second_name_kana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（カナ）は不正な値です'
      end

      it '誕生日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "誕生日を入力してください"
      end
    end
  end
end
