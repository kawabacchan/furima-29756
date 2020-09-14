require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "上手くいく時" do
      it "nickname, email, password, password_confirmation, family_name, first_name, family_kananame, first_kananame, birthdayが存在する" do
        expect(@user).to be_valid
      end
    end
    context '新規登録が上手くいかない時' do
      it "nicknameが空では登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@を含まない場合は登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameが英数字では登録できない" do
        @user.family_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが英数字では登録できない" do
        @user.first_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "family_kananameが空では登録できない" do
        @user.family_kananame = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kananame can't be blank")
      end
      it "family_kananameがカタカナ以外では登録できない" do
        @user.family_kananame = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kananame 全角カタカナを使用してください")
      end
      it "first_kananameが空では登録できない" do
        @user.first_kananame = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First kananame can't be blank")
      end
      it "first_kananameがカタカナ以外では登録できない" do
        @user.first_kananame = "一郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kananame 全角カタカナを使用してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
