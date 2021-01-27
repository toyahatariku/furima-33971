require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録" do
    it "全ての項目が埋まっていると登録できる" do
      expect(@user).to be_valid
    end

    it "ニックネームが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "メールアドレスが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "メールアドレスが重複していると登録できない" do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.password_confirmation = @user.password_confirmation
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "メールアドレスに@が含まれていないと登録できない" do
      @user.email = "tesst.test.test"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it "パスワードが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "パスワードが６文字未満だと登録できない" do
    end
    it "パスワードは半角英数字混同でないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it "パスワード（確認用）が空だと登録できない" do
    end
    it "パスワードがパスワード（確認用）と一致してないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "苗字が空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "苗字が全角（漢字）でないと登録できない" do
    end
    it "苗字が全角（ひらがな）でないと登録できない" do
    end
    it "苗字が全角（カタカナ）でないと登録できない" do
    end

    it "名前が空だと登録できない" do
      @user.second_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name can't be blank"
    end
    it "名前が全角（漢字）でないと登録できない" do
    end
    it "名前が全角（ひらがな）でないと登録できない" do
    end
    it "名前が全角（カタカナ）でないと登録できない" do
    end

    it "苗字（カナ）が空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "苗字（カナ）がカタカナでないと登録できない" do
    end

    it "名前（カナ）が空だと登録できない" do
      @user.second_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana can't be blank"
     end
    it "名前（カナ）がカタカナでないと登録できない" do
    end

    it "誕生日が空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
