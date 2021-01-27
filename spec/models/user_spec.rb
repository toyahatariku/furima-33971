require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録" do
    it "ニックネームが空だと登録できない" do
    end

    it "メールアドレスが空だと登録できない" do
    end
    it "メールアドレスが重複していると登録できない" do
    end
    it "メールアドレスに@が含まれていないと登録できない" do
    end

    it "パスワードが空だと登録できない" do
    end
    it "パスワードが６文字未満だと登録できない" do
    end
    it "パスワードは半角英数字混同でないと登録できない" do
    end

    it "パスワード（確認用）が空だと登録できない" do
    end
    it "パスワードがパスワード（確認用）と一致してないと登録できない" do
    end

    it "苗字が空だと登録できない" do
    end
    it "苗字が全角（漢字）でないと登録できない" do
    end
    it "苗字が全角（ひらがな）でないと登録できない" do
    end
    it "苗字が全角（カタカナ）でないと登録できない" do
    end

    it "名前が空だと登録できない" do
    end
    it "名前が全角（漢字）でないと登録できない" do
    end
    it "名前が全角（ひらがな）でないと登録できない" do
    end
    it "名前が全角（カタカナ）でないと登録できない" do
    end

    it "苗字（カナ）が空だと登録できない" do
    end
    it "苗字（カナ）がカタカナでないと登録できない" do
    end

    it "名前（カナ）が空だと登録できない" do
    end
    it "名前（カナ）がカタカナでないと登録できない" do
    end

    it "誕生日が空だと登録できない" do
    end
  end
end
