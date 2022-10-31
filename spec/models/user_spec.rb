require 'rails_helper'

RSpec.describe User, type: :model do
before do
@user = FactoryBot.build(:user)
end
describe '会員情報入力' do
  context '新規登録できる場合' do
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
    end
  end
  context '新規登録できない場合' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@がないと登録できない" do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複したemailが存在すれば登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以下であれば登録できない" do
      @user.password = "00YY"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = "12345W"
      @user.password_confirmation = "123456W"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "名字が空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "名前が空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
      it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it "フリガナ（名字）が空だと登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "フリガナ（名前）が空だと登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.last_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
    end
    it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
    end
    it "生年月日が空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
end


